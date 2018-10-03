class ItemsController < ApplicationController
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
	def modif
		@tmp = Item.find_by_stock(params[:id])
		@item = Item.find(params[:id])
		@item = @item + @tmp
		if @item.update_attribute(@item.stock, :stock)

			redirect_to @item
		else
			render 'modify'
		end
	end
	private
		def item_params
			params.require(:item).permit(:ino,:name,:price,:stock)
		end
end
