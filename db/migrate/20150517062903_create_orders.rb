class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :customer_id,               null: false
      t.integer :product_id,                null: false
      t.integer :address_id,                null: false
      t.integer :quantity,                  null: false
      t.string  :braintree_transaction_id,  null: false
      t.timestamps                          null: false
    end
  end
end
