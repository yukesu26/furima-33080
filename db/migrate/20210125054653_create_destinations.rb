class CreateDestinations < ActiveRecord::Migration[6.0]
  def change
    create_table :destinations do |t|
      t.string :post_code,               null: false
      t.integer :shipping_place_id,      null: false
      t.string :city,                    null: false 
      t.string :address,                 null: false
      t.string :phone_number,            null: false 
      t.string :building_name
      t.references :buy,foreign_key: true
      t.timestamps
    end
  end
end
