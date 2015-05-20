require File.expand_path("../../test_helper", __FILE__)

describe OrderSimulator do

  describe ".create!" do
    before do
      @order_count    = Order.count(:id)
      @customer_count = Customer.count(:id)
      @address_count  = Address.count(:id)
    end

    it "should create a random order with a random customer" do
      OrderSimulator.create!

      Order.count(:id).must_equal @order_count + 1
      Customer.count(:id).must_equal @customer_count + 1
      Address.count(:id).must_equal @address_count + 1
    end
  end

end