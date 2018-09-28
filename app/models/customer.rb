class Customer < ApplicationRecord
	validates :name, presence: true,
                    length: { minimum: 5 }
	has_many :orders
	has_many :items, through: :orders
end
