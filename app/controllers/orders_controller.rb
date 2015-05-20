class OrdersController < ApplicationController
  skip_before_action :verify_authenticity_token  

  def create
    begin
      ActiveRecord::Base.transaction do
        c = Customer.create! customer_params
        a = c.addresses.create address_params
        o = Order.new customer: c, address: a, product: Product.current, quantity: params[:quantity]

        result = Braintree::Transaction.sale(
          amount: o.total_price, 
          payment_method_nonce: params[:payment_method_nonce],
          options: {
            submit_for_settlement: true,
            store_in_vault_on_success: true
          }
        )

        raise result.errors.first.message if !result.success?

        o.braintree_transaction_id = result.transaction.id
        o.save!
      end

      flash[:success] = "Thank you. Your order is being processed."
    rescue => e
      flash[:error] = e.message
    end

    redirect_to :root
  end

  private

    def customer_params
      params.require(:customer).permit(:first_name, :last_name, :email)
    end

    def address_params
      params.require(:address).permit(:street_address, :extended_address, :country_code_alpha2, :region, :locality, :postal_code)
    end

end
