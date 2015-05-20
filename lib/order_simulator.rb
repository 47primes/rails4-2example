require 'faker'

class OrderSimulator

  class << self

    def create!
      c = customer
      a = address(c)
      quantity = [rand(10), 1].max

      Order.create! customer: c, address: a, product: Product.current, quantity: quantity, braintree_transaction_id: Faker::Internet.password(6)
    end

    private

      def customer
        c = Customer.create!  first_name: Faker::Name.first_name,
                              last_name: Faker::Name.last_name,
                              email: Faker::Internet.email,
                              braintree_customer_id: SecureRandom.hex
      end

      def address(c)
        if us_address?
          state = Address.us_state_abbreviations.sample
          country = "US"
        else
          state = nil
          country = countries.sample.first
        end

        c.addresses.create  street_address: Faker::Address.street_address, 
                            locality: Faker::Address.city, 
                            region: state,
                            country_code_alpha2: country
      end

      def countries
        return @countries if @countries

        @countries = Address.countries
        @countries.delete(["United States", "US"])
        @countries
      end

      def us_address?
        Time.now.to_i % 3 == 0
      end
  end

end