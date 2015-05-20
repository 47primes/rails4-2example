require 'test_helper'

class OrderPublisherJobTest < ActiveJob::TestCase
  it "should publish a message to the order feed and an order total message" do
    Order.stub :total_message, "shipped 20 cases to 20 happy customers in 20 countries" do
      OrderPublisherJob.perform_now("1 case to Bilbo in Bag End, Middle Earth")
    end
  end
end
