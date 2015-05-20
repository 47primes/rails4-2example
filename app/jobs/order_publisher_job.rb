class OrderPublisherJob < ActiveJob::Base
  queue_as :default

  def perform(*args)
    OrderPublisher.feed args.first

    OrderPublisher.total Order.total_message
  end
end
