# README

#テーブル設計

＃＃usersテーブル

|Colmun              | Type    | option     |
|--------------------|---------|------------|-----
|email               | string  | null: false|
|encrypted_password  | string  | null: false| 
|nickname            | string  | null: false|
|last_name           | string  | null: false|
|first_name          | string  | null: false|
|last_name_kana      | string  | null: false|
|first_name_kana     | string  | null: false|
|birthday_year       | string  | null: false| 
|birthday_month      | string  | null: false|
|birthday_day        | string  | null: false|



###association
has_many :items
has_many :purchase_records



＃＃itemsテーブル

|Colmun              | Type       | option     |
|--------------------|------------|------------|-----
|items_name          | string     | null: false|
|explanation         | text       | null: false| 
|category            | string     | null: false|
|situation           | string     | null: false|
|delivery_charge     | string     | null: false|
|shipping_location   | string     | null: false|
|days_to_ship        | string     | null: false|
|price               | integer    | null: false| 
|user                | references | null: false|



###association
belongs_to :user
has_one :purchase_record

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
|post_code           | integer    | null: false                   |
|prefecture          | string     | null: false                   | 
|municipalitie       | string     | null: false                   |
|address             | integer    | null: false                   |
|building            | string     | null: false                   |
|telephone           | integer    | null: false                   |
|purchase_record     | references | null: false, foreign_key: true|


###association
belongs_to :purchase_record
