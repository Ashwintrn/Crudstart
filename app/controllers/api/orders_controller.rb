class Api::OrdersController < ApplicationController
	protect_from_forgery with: :null_session
	#before_action :destroy_session
	respond_to :json
	# def destroy_session
	# 	request.session_options[:skip] = true
	# end
	#doorkeeper_for :all
	before_action :doorkeeper_authorize!
	#DISPLAY ALL CUSTOMERS
	def index 				
		#@customer = Customer.find(doorkeeper_token.resource_owner_id) 
		@orders=current_customer.orders
		respond_to do |format|
			format.json { render json: @orders  }
			format.xml { render file: 'show.xml.builder', content_type: "application/xml" }
			format.html { render 'customers/show' }
		end
		#super
	end

	# def show
	# 	#@customer = Customer.find(params[:id])
	# 	@orders=current_customer.orders
	# 	respond_to do |format|
	# 		format.json { render json: @orders  }
	# 		format.xml { render file: 'show.xml.builder', content_type: "application/xml" }
	# 		format.html { render 'customers/show' }
	# 	end
	# end

	def create
	#	@order=current_customer.orders
	byebug
		@orders = current_customer.order.create(params[:@order])
		respond_to do |format|
			format.json { render json: @orders  }
			format.xml { render file: 'show.xml.builder', content_type: "application/xml" }
			format.html { render 'customers/show' }
		end
	end

	private
	def current_customer
			current_customer ||= Customer.find(doorkeeper_token.resource_owner_id)
	end

end