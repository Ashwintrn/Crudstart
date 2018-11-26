require 'rails_helper'

# def get_name
#   byebug
#   returns self.name
# end

RSpec.describe ItemsController, type: :controller do
Rails.cache.clear
 subject { [build(:pen),build(:pencil) ] }
  describe "GET index" do
    it "assigns @item" do
      expect(subject.get_name).to match_array([:pen,:pencil])
    end

    # it "renders the index template" do
    #   get :index
    #   expect(response).to render_template("index")
    # end

    # it "responds to custom formats when provided in the params" do
    #   post :create, :params => { :item => { :name => "Any Name" }, :format => :json }
    #   expect(response.content_type).to eq "text/html"
    # end
  end
end
