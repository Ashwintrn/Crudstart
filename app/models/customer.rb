class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :profile_name

	  validates :name, presence: true,
                    length: { minimum: 5 }
    validates :phone, presence: true, length: {is: 10}, numericality: { only_integer: true }
end
