class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :first_name,           null: false
      t.string :last_name,            null: false
      t.string :email,                null: false
      t.string :braintree_customer_id
      t.timestamps                    null: false
    end
  end
end
