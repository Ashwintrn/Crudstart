FactoryBot.define do
	factory :pen, :class =>Item do
		name "pen"
	end
	factory :pencil ,:class =>Item do
		name "pencil"
	end
	factory :order do
		quantity 2
		stock 4
	end
	factory :customer do
		name "ihnaq"
		email "rihs@gmail.com"
		phone 1234567889
		password "1aA!qwer"
	end
end
