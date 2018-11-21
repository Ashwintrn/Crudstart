require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  describe "GET index" do
    it "assigns @item" do
      item = Item.create
      get :index
      expect(assigns(:item)).to eq([item])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "responds to custom formats when provided in the params" do
      post :create, :params => { :item => { :name => "Any Name" }, :format => :json }
      expect(response.content_type).to eq "text/html"
    end
  end
end
