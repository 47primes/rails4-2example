class Order < ActiveRecord::Base

  validates :customer_id, presence: true
  validates :product_id, presence: true
  validates :address_id, presence: true
  validates :quantity, presence: true, numericality: {integer_only: true, greater_than: 0}

  belongs_to :customer
  belongs_to :product
  belongs_to :address

  after_create :push

  def total_price
    product.price * quantity
  end

  def feed_message
    "#{quantity} #{"case".pluralize(quantity)} to #{customer.first_name} in #{address.short_format}"
  end

  private

    def push
      OrderPublisherJob.perform_later(self.feed_message)
    end

  def self.total_message
    case_count = Order.sum(:quantity)
    customer_count = Customer.count(:id)
    country_count = Address.count("distinct country_code_alpha2")

    if case_count == 0
      "ready to start shipping orders immediately"
    else
      "shipped #{case_count} #{"case".pluralize(case_count)} to #{customer_count} happy #{"customer".pluralize(customer_count)} in #{country_count} #{"country".pluralize(country_count)}"
    end
  end

end
