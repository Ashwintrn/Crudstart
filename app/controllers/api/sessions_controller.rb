class SessionsController < ApplicationController
	def new
		session[:return_to] = params[:return_to] if params[:return_to]
	end

	def create
		customer = Customer.find_by_name(params[:name])
		if customer && customer.autheticate(params[:password])
			session[:customer_id] = customer_id
			if session[:return_to]
				redirect_to session[:return_to]
				session[:return_to] = nil
			else
				redirect_to root_url
			end
		else
			flash.now.alert = "Email or password is invalid"
			render "new"
		end
	end

	def destroy
		session[:customer_id] = nil
		redirect_to new_customer_session_url
	end
end