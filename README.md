## usersテーブル

|Column                     |Type                       |Options                   |
|---------------------------|---------------------------|--------------------------|
|nickname                   |string                     |null: false               |
|email                      |string                     |null: false               |
|password                   |string                     |null: false               |
|family_name                |string                     |null: false               |
|first_name                 |string                     |null: false               |
|family_name_kana           |string                     |null: false               |
|first_name_kana            |string                     |null: false               |
|birthday                   |date                       |null: false               |

## Association
-has_many :items
-has_many :new_items
-has_many :purchase_details



## itemsテーブル


|Column                     |Type                       |Options                   |
|---------------------------|---------------------------|--------------------------|
|name                       |string                     |null: false               |
|category                   |string                     |null: false               |
|description                |string                     |null: false               |
|status                     |integer                    |null: false               |
|delivery_charge_bearer	    |integer                    |null: false               |
|prefecture_id              |integer                    |null: false               |
|delivery_days              |integer                    |null: false               |
|price                      |integer                    |null: false               |

## Association
-belongs_to :user



 ## new_itemテーブル

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
-belongs_to :new_item


## destinationテーブル

|Column                     |Type                       |Options                   |
|---------------------------|---------------------------|--------------------------|
|card_id                    |integer                    |null: false               |
|date                       |date                       |null: false               |
|code                       |integer                    |null: false               |
|post_number                |integer                    |null: false               |
|municipality               |string                     |null: false               |
|address                    |string                     |null: false               |
|building                   |string                     |null: false               |
|phone                      |integer                    |null: false               |

## Association 
-belongs_to :user