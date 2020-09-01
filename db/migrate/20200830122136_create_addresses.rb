class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :postalcode,      null: false
      t.integer :shipping_origin_id,     null: false
      t.string :city,            null: false
      t.string :house_number,   null: false
      t.string :building
      t.string :telephone,   null: false
      t.references :item_purchase,       null: false,  foreign_key: true
      t.timestamps
    end
  end
end
