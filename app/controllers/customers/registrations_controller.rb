# frozen_string_literal: true

class Customers::RegistrationsController < Devise::RegistrationsController
  #before_action :configure_sign_up_params, only: [:create], if: :devise_controller?
  # before_action :configure_account_update_params, only: [:update]
  # respond_to :json
  #before_action :doorkeeper_authorize!
  #doorkeeper_for :all
  #skip_before_action :doorkeeper_authorize!
  # GET /resource/sign_up
  prepend_before_action :require_no_authentication, only: :cancel

  def new
     super
  end

  def show
    # respond_to do |format|
    #   format.json {render :json }
    # end
    super
  end

  # POST /resource
  def create
    super
  end

  # GET /resource/edit
  def edit
    super
  end

  # PUT /resource
  def update

    @customer = current_customer
    if params[:customer][:password].blank? && @customer.valid_password?(params[:customer][:current_password])
      params[:customer][:password] = params[:customer][:current_password]
      params[:customer][:password_confirmation] = params[:customer][:current_password]
    end 
    super
    #@customer.update_with_password(params[:customer])
    # @customer = current_customer
    # if params([:customer][:password]) <=> params([:customer][:password_confirmation])
    #   if @customer.password <=> params([:customer][:current_password])
    #     @customer.update_with_password(account_update_params)
    #   end
    # end
  end

  # DELETE /resource
  def destroy
    super
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  #def configure_sign_up_params
  #	attributes = [:name, :dob, :address, :phone]
  #  devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  #end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  # byebug
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:name,:dob,:address,:phone, :email, :password, :password_confirmation])
  # end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    #super(resource)
    stored_location_for(resource) || list_order_path(resource)
  end

  def after_sign_in_path_for(resource)
  #  byebug
    stored_location_for(resource) || list_order_path(resource)
  end

  def after_update_path_for(resource)
    stored_location_for(resource) || list_order_path(resource)
  end
  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
  private
  	def sign_up_params
			params.require(:customer).permit(:name,:dob,:address,:phone, :email, :password, :password_confirmation)
		end

    def account_update_params
    #   byebug
      params.require(:customer).permit(:name,:dob,:address,:phone, :email, :password, :password_confirmation, :current_password)
    end
end
