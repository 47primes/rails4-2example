class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.integer :customer_id,         null: false
      t.boolean :primary,             default: false
      t.string  :street_address,      null: false
      t.string  :extended_address
      t.string  :locality,            null: false
      t.string  :region
      t.string  :postal_code
      t.string  :country_code_alpha2, null: false
      t.timestamps                    null: false
    end
  end
end
