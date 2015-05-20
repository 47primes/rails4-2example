require "test_helper"

describe OrdersController do
  it "should create a new order" do
    order_count = Order.count(:id)

    post :create, {quantity: "3", customer: {first_name: "John", last_name: "Doe", email: "foo@bar.com"}, address: {street_address: "123 4th St.", extended_address: "", country_code_alpha2: "US", region: "TX", locality: "Austin", postal_code: "78701"}}

    Order.count(:id).must_equal order_count + 1

    flash[:success].wont_be_empty
  end

  it "should return a message on error" do
    post :create, {quantity: "", customer: {first_name: "John", last_name: "Doe", email: "foo@bar.com"}, address: {street_address: "123 4th St.", extended_address: "", country_code_alpha2: "US", region: "TX", locality: "Austin", postal_code: "78701"}}

    flash[:error].wont_be_empty
  end
end
