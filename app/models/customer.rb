class Customer < ApplicationRecord
	validates :name, presence: true,
                    length: { minimum: 5 }

   has_and_belongs_to_many :orders
end
