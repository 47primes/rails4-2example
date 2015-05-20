class OrderPublisher
  FEED_CHANNEL  = "order-feed"
  FEED_EVENT    = "created"
  TOTAL_CHANNEL = "order-total"
  TOTAL_EVENT   = "updated"

  class << self
    def instance
      @instance ||= Pusher::Client.new  app_id: Pusher.app_id, 
                                        key:    Pusher.key, 
                                        secret: Pusher.secret
    end

    def feed(message)
      publish(FEED_CHANNEL, FEED_EVENT, message)
    end

    def total(message)
      publish(TOTAL_CHANNEL, TOTAL_EVENT, message)
    end

    def publish(channel, event, message)
      instance.trigger(channel, event, { message: message })
    end
  end
end