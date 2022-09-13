## usersテーブル

|Column                     |Type                       |Options                   |
|---------------------------|---------------------------|--------------------------|
|nickname                   |string                     |null: false               |
|email                      |string                     |null: false, unique: true |
|encrypted_password         |string                     |null: false               |
|family_name                |string                     |null: false               |
|first_name                 |string                     |null: false               |
|family_name_kana           |string                     |null: false               |
|first_name_kana            |string                     |null: false               |
|birthday                   |date                       |null: false               |

## Association
-has_many :items
-has_many : purchase_records




## itemsテーブル


|Column                     |Type                       |Options                       |
|---------------------------|---------------------------|------------------------------|
|name                       |string                     |null: false                   |
|category_id                |integer                    |null: false                   |
|description_id             |integer                    |null: false                   |
|status_id                  |integer                    |null: false                   |
|delivery_charge_bearer_id  |integer                    |null: false                   |
|prefecture_id              |integer                    |null: false                   |
|price                      |string                     |null: false                   |
|user                       |references                 |foreign_key :true, null: false|
|description                |text                       |null: false                   |

## Association
-belongs_to :user
-has_one :purchase_record



 ## purchase_recordsテーブル

|Column                     |Type                       |Options                       |
|---------------------------|---------------------------|------------------------------|
|user                       |references                 |foreign_key :true, null: false|
|item                       |references                 |foreign_key :true, null: false|

-belongs_to :user
-has_one :destination
-belongs_to :item


## destinationsテーブル

|Column                     |Type                       |Options                       |
|---------------------------|---------------------------|------------------------------|
|code                       |string                     |null: false                   |
|prefecture_id              |integer                    |null: false                   |
|address                    |string                     |null: false                   |
|building                   |string                     |                              |
|phone                      |string                     |null: false                   |
|purchase_record            |references                 |foreign_key: true, null: false|
|municipality               |string                     |null: false                   |

## Association 
-belongs_to :purchase_record
