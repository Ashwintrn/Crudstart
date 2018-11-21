class AuthController < ApplicationController
  # This is our new function that comes before Devise's one
  before_action :authenticate_customer_from_token!, :except => [:access_token]

  #before_filter :authenticate_customer!, :except => [:access_token]
  skip_before_action :verify_authenticity_token, :only => [:access_token]

  def authorize
    # Note: this method will be called when the customer
    # is logged into the provider
    #
    # So we're essentially granting him access to our
    # system by generating certain tokens and then
    # redirecting him back to the params[:redirect_uri]
    # with a random code and the params[:state]


    #OAuth2::AccessGrant.prune!
    create_hash = {
      client: application,
      state: params[:state]
    }
    access_grant = current_customer.access_grants.create(create_hash)
    redirect_to access_grant.redirect_uri_for(params[:redirect_uri])
  end

  # POST
  def access_token
    application = OAuth2::Client.authenticate(params[:client_id], params[:client_secret])

    if application.nil?
      render :json => {:error => "Could not find application"}
      return
    end

    access_grant = AccessGrant.authenticate(params[:code], application.id)
    if access_grant.nil?
      render :json => {:error => "Could not authenticate access code"}
      return
    end

    access_grant.start_expiry_period!
    render :json => {:access_token => access_grant.access_token, :refresh_token => access_grant.refresh_token, :expires_in => Devise.timeout_in.to_i}
  end

  def customer
    hash = {
      provider: 'sso',
      id: current_customer.id.to_s,
      info: {
         email: current_customer.email,
      },
    }

    render :json => hash.to_json
  end

  protected

  def application
    @application ||= OAuth2::Client.find_by_app_id(params[:client_id])
  end

  private

  def authenticate_customer_from_token!
    if params[:oauth_token]
      access_grant = AccessGrant.where(access_token: params[:oauth_token]).take
      if access_grant.customer
        # Devise sign in
        new_customer_session_url access_grant.customer
      end
    end
  end
end