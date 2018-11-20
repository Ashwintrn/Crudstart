class Api::CustomersController < ApplicationController
	before_filter :authenticate_customer!
	respond_to :json

	def index
		@customer= current_customer
		respond_to do |format|
			format.json { render json: @customer }
			format.xml { render file: 'show.xml.builder', content_type: "application/xml" }
			format.html { render 'customers/show' }
		end
	end

def show
		@customer= current_customer
		respond_to do |format|
			format.json { render json: @customer }
			format.xml { render file: 'show.xml.builder', content_type: "application/xml" }
			format.html { render 'customers/show' }
		end
	end	

	private 
	def current_customer
			current_customer ||= Customer.find(doorkeeper_token.resource_owner_id)
	end
end