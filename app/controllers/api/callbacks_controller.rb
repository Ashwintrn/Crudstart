class CallbacksController < ApplicationController

  def oauth2
    @customer = Customer.from_omniauth(request.env["omniauth.auth"])
    new_customer_session_and_redirect @customer
  end

end
