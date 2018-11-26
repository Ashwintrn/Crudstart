require 'rails_helper'
RSpec.describe Api::OrdersController do
  before { controller.stub(:current_customer).and_return (@customer = create(:customer)) }

  describe "GET #index" do
    before do
      get :index
    end
    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
    it "JSON body response contains expected recipe attributes" do
      json_response = eval(response.body)
      expect(json_response).to match_array(@customer)
    end
  end
  # describe "Customers API" do
  
  # it 'sends a list of messages' do
  #   FactoryBot.build(:customer)

  #   get :show , :customer_id => 1

  #   json = JSON.parse(response.body)

  #   # test for the 200 status-code
  #   expect(response).to be_success

  #   # check to make sure the right amount of messages are returned
  #   expect(json['customers'].length).to eq(10)
  # end

  # end
end