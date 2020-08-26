class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :name,             null: false
      t.text    :text,             null: false
      t.integer :category,         null: false
      t.integer :status,           null: false
      # t.text :image,               null: false
      t.integer :price_id,            null: false
      t.integer :shipping_days,    null: false
      t.integer :shipping_origin,  null: false
      t.integer :delivery_fee,     null: false
      t.references :user,          null: false, foregin_key: true
      t.timestamps
    end
  end
end
