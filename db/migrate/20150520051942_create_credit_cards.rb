class CreateCreditCards < ActiveRecord::Migration
  def change
    create_table :credit_cards do |t|
      t.integer     :customer_id,     null: false
      t.integer     :last_four,       null: false
      t.string      :braintree_token, null: false
      t.integer     :bin,             null: false
      t.string      :card_type,       null: false
      t.string      :expiration_date, null: false
      t.string      :image_url,       null: false
      t.timestamps                    null: false
    end
  end
end
