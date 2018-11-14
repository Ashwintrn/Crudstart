# Create an api controller for customer  to authenticate token , authorize , 
# every request should pass through this controller..
# route ah neye mudivu pannu .
class ApiController < ApplicationController
	before_action :set_default_format
	private
		def set_default_format
			request.format = :json
		end
end