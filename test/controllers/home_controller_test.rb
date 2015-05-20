require "test_helper"

describe HomeController do
  describe "index" do
    it "must generate a Braintree client token" do
      Braintree::ClientToken.stub :generate, "some-client-token" do
        get :index
        
        assigns(:braintree_client_token).must_equal "some-client-token"
      end
    end

    it "must set current_product instance variable" do
      Braintree::ClientToken.stub :generate, "some-client-token" do
        get :index

        assigns(:current_price).must_equal 23.99
      end
    end
  end
end
