class OrdersController < ApplicationController
	def index
		@order = Order.all
	end
	def show
		@order = Order.find(params[:id])
	end
	def new
		#@customer = Customer.find_by_id (params[:id])
		@order = Order.new(:customer_id => params[:id])
	end
	def list
		@customer = current_customer
		@ans= @customer.orders
		#@tmp = params[:id]
		#@orde = Order.where(:customer_id => params[:id])
		#@ans = @orde.to_a{|o| o.select(:item_id)}
		#@ans = Order.select(:item_id,:quantity).from(@orde)		
		# @orde= Order.select("item_id").where(":customer_id = ",@tmp)
		# @ans = @ords.to_a.uniq{|o| o.item_id}
		
	end
	def create
		@order = Order.new(order_params)
		@order.total_cost = @order.item.price * @order.quantity
		

		if @order.save
			redirect_to @order
		else
			render 'new'
		end
	end
	private
		def order_params
			params.require(:order).permit(:customer_id, :item_id, :quantity)
		end
		
end
