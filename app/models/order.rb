class Order < ApplicationRecord
	belongs_to :customer
	belongs_to :item
	validate :update_item_stock
	def update_item_stock
		item.stock-=self.quantity
		if item.stock < 0

			#self.errors.add"Stock unavailable ,try with lesser quantity"
			#validates :stock, numericality: { :greater_than_or_equal_to => 0}
			self.errors.add(:stock , "Stock unavailable ,try with lesser quantity")
			return false
		else	
			item.save
		end
	end
end
