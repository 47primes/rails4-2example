class HomeController < ApplicationController

  def index
    @braintree_client_token = Braintree::ClientToken.generate
    @current_price          = Product.current.price
    @pusher_key             = Pusher.key
    @order_feed_channel     = OrderPublisher::FEED_CHANNEL
    @order_feed_event       = OrderPublisher::FEED_EVENT
    @order_total_channel    = OrderPublisher::TOTAL_CHANNEL
    @order_total_event      = OrderPublisher::TOTAL_EVENT
    @order_total_message    = Order.total_message
  end

end
