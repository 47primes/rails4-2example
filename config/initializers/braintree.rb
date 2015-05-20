Braintree::Configuration.environment = Rails.application.config.braintree_environment
Braintree::Configuration.merchant_id = ENV['BRAINTREE_MERCHANT_ID']
Braintree::Configuration.public_key  = ENV['BRAINTREE_PUBLIC_KEY']
Braintree::Configuration.private_key = ENV['BRAINTREE_PRIVATE_KEY']

module Braintree

  def self.generate_customer_id
    SecureRandom.hex
  end

end