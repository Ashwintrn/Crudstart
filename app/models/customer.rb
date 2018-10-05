class Customer < ApplicationRecord
	  validates :name, presence: true,
                    length: { minimum: 5 }
    validates :phone, presence: true, length: {is: 10}, numericality: { only_integer: true }
end
