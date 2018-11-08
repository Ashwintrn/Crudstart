class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :orders
  has_many :items, through: :orders
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :profile_name
  #before_commit :configure_permitted_parameters, if: :devise_modules?
  #validates :email, presence: true
  validates :name, presence: true,
                    length: { minimum: 5 }
  validates :phone, presence: true, length: {is: 10}, numericality: { only_integer: true }

  validates :password, length: { in: Devise.password_length }, format: { with: /\A(?=.{8,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[[:^alnum:]])/, multiline: true, message:"Format is incorrect"  }
  #protected

  #def configure_permitted_parameters
  #  devise_parameter_sanitizer.permit(:sign_up) do |customer_params|
   #  customer_params.permit(:name,:dob,:address,:phone)
    #end
  #end
end
