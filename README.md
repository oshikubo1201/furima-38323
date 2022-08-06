# README

#テーブル設計

＃＃usersテーブル

|Colmun              | Type    | option                   |
|--------------------|---------|--------------------------|-----
|email               | string  | null: false, unique: true|
|encrypted_password  | string  | null: false              | 
|nickname            | string  | null: false              | 
|last_name           | string  | null: false              |
|first_name          | string  | null: false              |
|last_name_kana      | string  | null: false              |
|first_name_kana     | string  | null: false              |
|birthday            | date    | null: false              |  



###association
has_many :items
has_many :purchase_records



＃＃itemsテーブル

|Colmun                 | Type       | option                        | 
|-----------------------|------------|-------------------------------|
|items_name             | string     | null: false                   |
|explanation            | text       | null: false                   |  
|category_id            | references | null: false, foreign_key: true|
|situation_id           | references | null: false, foreign_key: true|
|delivery_charge_id     | references | null: false, foreign_key: true|
|shipping_location_id   | references | null: false, foreign_key: true|
|days_to_ship_id        | references | null: false, foreign_key: true|
|price                  | integer    | null: false                   | 
|user_id                | references | null: false, foreign_key: true|



###association
belongs_to :user
has_one :purchase_record
belongs_to :category_id
belongs_to :situation_id
belongs_to :delivery_charge_id
belongs_to :shipping_location_id
belongs_to :days_to_ship_id

＃＃purchase_recordsテーブル

|Colmun              | Type       | option                        |
|--------------------|------------|-------------------------------|-
|user_id             | references | null: false, foreign_key: true|
|item_id             | references | null: false, foreign_key: true|


###association
belongs_to :user
belongs_to :item
has_one :shipping_address


＃＃shipping_addressesテーブル

|Colmun              | Type       | option                        |
|--------------------|------------|-------------------------------|--
|post_code           | string     | null: false                   |
|prefecture_id       | string     | null: false, foreign_key: true| 
|municipalitie       | string     | null: false                   |
|address             | string     | null: false                   |
|building            | string     |                               |
|telephone           | string     | null: false                   |
|purchase_record_id  | references | null: false, foreign_key: true|


###association
belongs_to :purchase_record
belongs_to :prefecture_id
