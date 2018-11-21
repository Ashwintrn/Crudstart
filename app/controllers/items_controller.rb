class ItemsController < ApplicationController
	#before_action :doorkeeper_authorize!
	def index
		@item = Item.all
	end
	def show
		@item = Item.find(params[:id])
	end
	def new
		@item = Item.new
	end
	def edit
		@item = Item.find(params[:id])
	end
	def modify
		@item = Item.find(params[:id])
		#@t = @item
		#@item.increment!('stock',5)
	end
	def create
		@item = Item.new(item_params)

		if @item.save
			redirect_to @item
		else
			render 'new'
		end
	end
	def modif
		#puts " --------------------------------------------------------------------"
		#byebug
		@tmp =  Integer(params[:item][:stock])
		@item = Item.find(params[:id])
		if @item.update_attribute(:stock, @item.stock+@tmp)
			#@item.stock = @items
			redirect_to @item
		else
			render 'modify'
		end
	end
	def update
		@item = Item.find(params[:id])

		if @item.update(item_params)
			redirect_to @item
		else
			render 'edit'
		end
	end
	
	def destroy
		@item = Item.find(params[:id])
		@item.destroy

		redirect_to items_path
	end
	private
		def item_params
			params.require(:item).permit(:ino,:name,:price,:stock)
		end
end
