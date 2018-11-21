require 'rails_helper'

RSpec.describe Customers, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"

  customers = Customer.new(id: '9',name: 'hello',dob: '1-11-2003', address: 'erode',phone: '1234567890',created_at: '23-10-2018',updated_at: '03-10-2018',email: 'hello@gmail.com', password:'1aA!qwer')
  it "is valid with valid attributes" do
  	#customers = Customer.new(id: '9',name: 'hello',dob: '1-11-2003', address: 'erode',phone: '1234567890',created_at: '23-10-2018',updated_at: '03-10-2018',email: 'hello@gmail.com', password:'1aA!qwer')
  	expect(customers).to be_valid
  end

  it "is not valid without a name" do
  	#customers = Customer.new(id: '9',name: 'hello',dob: '1-11-2003', address: 'erode',phone: '1234567890',created_at: '23-10-2018',updated_at: '03-10-2018',email: 'hello@gmail.com', password:'1aA!qwer')
  	expect(Customer.new(name: 'hsdhb')).to_not be_valid
  end

  it "responds to order" do
  	expect(customers.name).to_not be_nil
  end

  it "checks password length " do
  	expect(customers.password.length).to be >= 8
  end

  it { is_expected.not_to respond_to(:to_model) }

  it { expect(customers.email).to end_with ".com"}

  it { expect(customers.password).to_not contain_exactly('qwerty') }

  specify { expect{ customers.email}.to_not throw_symbol}
end
