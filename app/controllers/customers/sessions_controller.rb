# frozen_string_literal: true

class Customers::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  #before_action :doorkeeper_authorize!
  # GET /resource/sign_in
  def new
    super
  end

  # POST /resource/sign_in
  def create
    # byebug
    @customer = Customer.find_by(email: params[:customer][:email])
    if @customer != nil
      if @customer.valid_password?(params[:customer][:password])
          session[:id] = current_customer.id
          redirect_to list_order_path(resource)
      else
        reset_session
        redirect_to '/'
      end
    else
      reset_session
      redirect_to '/'
    end
    #redirect_to list_order_path(resource)
    #super
  end

  # DELETE /resource/sign_out
  def destroy
    reset_session
    redirect_to '/'
  end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  end

  def after_sign_out_path_for(resource)
    super(resource)
  end
end
