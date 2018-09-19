class Customer < ApplicationRecord
	validates :name, presence: true,
                    length: { minimum: 5 }

    has_one :offer
end
