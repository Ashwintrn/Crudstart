class ApplicationController < ActionController::Base


#	before_action :authenticate_customer! , except: [:index, :list]
# 	before_action :unauthenticated_item!
#	before_action :configure_permitted_parameters, if: :devise_controller?
#	protected
def current_resource_owner
  Customer.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
end
# def configure_permitted_parameters
#    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
#  end
end
