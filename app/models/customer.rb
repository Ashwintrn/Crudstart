class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :profile_name
  #before_commit :configure_permitted_parameters, if: :devise_modules?
  #validates :email, presence: true
  #validates :name, presence: true,
  #                  length: { minimum: 5 }
  #validates :phone, presence: true, length: {is: 10}, numericality: { only_integer: true }

  #protected

  #def configure_permitted_parameters
  #  devise_parameter_sanitizer.permit(:sign_up) do |customer_params|
   #  customer_params.permit(:name,:dob,:address,:phone)
    #end
  #end
end
