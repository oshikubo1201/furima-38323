class CreateShippingAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_addresses do |t|
      t.string      :post_code,       null: false
      t.integer     :prefecture_id,   null: false
      t.string      :municipalitie,   null: false
      t.string      :address,         null: false
      t.string      :building
      t.string      :telephone,       null: false
      t.references  :purchase_record, null:false, foreign_key: true

      t.timestamps
    end
  end
end
