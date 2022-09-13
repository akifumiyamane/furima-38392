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


|Column                     |Type                       |Options                   |
|---------------------------|---------------------------|--------------------------|
|name                       |string                     |null: false               |
|category_id                |integer                    |null: false               |
|description                |text                       |null: false               |
|status                     |string                     |null: false               |
|delivery_charge_bearer	    |string                     |null: false               |
|prefecture_id              |integer                    |null: false               |
|delivery_days              |string                     |null: false               |
|price                      |string                     |null: false               |

## Association
-belongs_to :user




 ## purchase_recordsテーブル

|Column                     |Type                       |Options                   |
|---------------------------|---------------------------|--------------------------|
|seller                     |string                     |null: false               |
|category                   |string                     |null: false               |
|status                     |integer                    |null: false               |
|delivery_charge_bearer     |integer                    |null: false               |
|prefecture_id              |integer                    |null: false               |
|delivery_days              |integer                    |null: false               |

## Association
-belongs_to :user
-has_one :destination


## destinationsテーブル

|Column                     |Type                       |Options                   |
|---------------------------|---------------------------|--------------------------|
|code                       |string                     |null: false               |
|post_number                |string                     |null: false               |
|prefecture_id              |integer                    |null: false               |
|address                    |string                     |null: false               |
|building                   |string                     |                          |
|phone                      |string                     |null: false               |
|purchase_record_id         |reference                  |foreign_key: true         |

## Association 
-has_one :purchase_record
