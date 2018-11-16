class ApplicationController < ActionController::Base
#	before_action :doorkeeper_authorize!

#   respond_to :json, :html
#	before_action :authenticate_customer! , except: [:index, :list]
# 	before_action :unauthenticated_item!
#	before_action :configure_permitted_parameters, if: :devise_controller?
#	protected
	protect_from_forgery
# def authenticate_request
# 	@current_customer = AuthorizeApiRequest.call(request.headers).result
#     render json: { error: 'Not Authorized' }, status: 401 unless @current_customer
# end
# def authenticate_token
#   authenticate_with_http_token do |token, options|
#     OauthTokenAccess.where(auth_token: token).where("token_created_at >= ?", 1.month.ago).first
#   end
# end
def doorkeeper_unauthorized_render_options(error:nil )
	{json: {error: "UnAuthorized Access :401" ,
	 error_message: "Check Your Token"} }
end
def current_resource_owner
  Customer.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
end
# def configure_permitted_parameters
#    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
#  end
end
