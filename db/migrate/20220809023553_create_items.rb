class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :items_name, null: false
      t.text    :explanation, null: false
      t.integer :category_id, null: false
      t.integer :situation_id, null: false
      t.integer :delivery_charge_id, null: false
      t.integer :prefecture, null: false
      t.integer :days_to_ship_id, null: false
      t.integer :price, null: false
      t.references :user, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
