xml.instruct!
xml.orders do
	@orders.each do |order|
		xml.order do
			xml.id order.id
			xml.customer_id order.customer_id
			xml.item_id order.item_id
			xml.quantity order.quantity
			xml.total_cost order.total_cost
			xml.created_at order.created_at
			xml.updated_at order.updated_at
		end
	end
end