class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table  :products do |t|
        t.string  :name,                 null: false
        t.text    :memo,                 null: false
        t.integer :category_id,          null: false
        t.integer :item_state_id,        null: false
        t.integer :delivery_fee_id,      null: false
        t.integer :shipping_place_id,    null: false
        t.integer :send_day_id,          null: false
        t.integer :price,                null: false
        t.references :user, foreign_key: true
        t.timestamps
     end
  end
end
