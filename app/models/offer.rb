class Offer < ApplicationRecord
	belongs_to :customer, dependent: :destroy
end
