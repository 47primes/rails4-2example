class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.decimal :price, precision: 5, scale: 2, null: false
      t.timestamps                              null: false
    end
  end
end
