require "test_helper"

describe Order do
  let (:product) { Product.current }
  let (:customer) { Customer.new first_name: "Miskell", last_name: "McLennon", email: "foo@bar.com", braintree_customer_id: "blah" }
  let (:address) { Address.new street_address: "2300 Jackston St.", locality: "Gary", region: "IN", postal_code: "46407", country_code_alpha2: "US", customer: customer }

  describe "#quantity" do
    it "must be greater than zero" do
      o = Order.new quantity: 0

      o.valid?.must_equal false
      o.errors.keys.must_include :quantity
    end
  end

  describe "#total_price" do
    it "should be the multiple of product price and quantity" do
      o = Order.new product: product, quantity: 6

      o.total_price.must_equal 143.94
    end
  end

  describe "#feed_message" do
    it "should include a single quantity" do
      o = Order.new product: product, customer: customer, address: address, quantity: 1

      o.feed_message.must_match /\A1 case /
    end

    it "should include multiple quantities" do
      o = Order.new product: product, customer: customer, address: address, quantity: 6

      o.feed_message.must_match /\A6 cases /
    end

    it "should include customer first name" do
      o = Order.new product: product, customer: customer, address: address, quantity: 6

      o.feed_message.must_match /\A6 cases to Miskell /
    end

    it "should include address short format"do
      o = Order.new product: product, customer: customer, address: address, quantity: 6

      o.feed_message.must_match "6 cases to Miskell in Gary, IN, US"
    end
  end

  describe "after create" do
    it "should send messages to pusher" do
      customer.save!
      address.save!
      o = Order.create! product: product, customer: customer, address: address, quantity: 1, braintree_transaction_id: "blah"

      job = Delayed::Job.last
      job_handler = YAML.load job.handler

      job_handler.job_data["job_class"].must_equal "OrderPublisherJob"
    end
  end

  describe ".total_message" do
    it "should have a message if no orders have been made" do
      Order.stub :sum, 0 do
        Order.total_message.must_equal "ready to start shipping orders immediately"
      end
    end
  end
end
