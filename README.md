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
|category               | integer    | null: false                   |
|situation              | integer    | null: false                   |
|delivery_charge        | integer    | null: false                   |
|shipping_location      | integer    | null: false                   |
|days_to_ship           | integer    | null: false                   |
|price                  | integer    | null: false                   | 
|user                   | references | null: false, foreign_key: true|



###association
belongs_to :user
has_one :purchase_record

belongs_to :category
belongs_to :situation
belongs_to :delivery_charge
belongs_to :shipping_location
belongs_to :days_to_ship

＃＃purchase_recordsテーブル

|Colmun              | Type       | option                        |
|--------------------|------------|-------------------------------|-
|user                | references | null: false, foreign_key: true|
|item                | references | null: false, foreign_key: true|


###association
belongs_to :user
belongs_to :item
has_one :shipping_address


＃＃shipping_addressesテーブル

|Colmun              | Type       | option                        |
|--------------------|------------|-------------------------------|--
|post_code           | string     | null: false                   |
|prefecture          | integer    | null: false                   | 
|municipalitie       | string     | null: false                   |
|address             | string     | null: false                   |
|building            | string     |                               |
|telephone           | string     | null: false                   |
|purchase_record_id  | references | null: false, foreign_key: true|


###association
belongs_to :purchase_record
belongs_to :prefecture
