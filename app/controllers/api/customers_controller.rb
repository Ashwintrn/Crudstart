class Api::CustomersController < ApplicationController
	protect_from_forgery with: :null_session
	#before_action :destroy_session
	respond_to :json
	# def destroy_session
	# 	request.session_options[:skip] = true
	# end
	before_action :doorkeeper_authorize!
	#DISPLAY ALL CUSTOMERS
	# def index 				
	# 	@customer = Customer.all
	# 	respond_to do  |format|
	# 		format.json { render :json => @customer.to_json, :status => :ok }
	# 	end
	# 	#super
	# end

	def show
		@customer = Customer.find(params[:id])
		@order=@customer.orders
		respond_to do |format|
			format.json { render json: @order  }
			format.xml { render xml: @order }
			format.html { render html: @order }
		end
	end

end