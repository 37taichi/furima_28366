## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| first_name     | string | null: false |
| family_name     | string | null: false |
| first_name_kana     | string | null: false |
| family_name_kana     | string | null: false |
| nickname | string | null: false |
| password | string | null: false |
| birthday | date | null: false |
| email    | string | null: false |

### Association
- has_many :items
- has_one :transaction

## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |
| text   | text    | null: false |
| category| integer | null: false |
| status | integer  | null: false |
| image  |  text   | null: false |
| price  | integer | null: false |
| shipping_days | integer | null: false |
| shipping_origin | string | null: false |
| delivery_fee | integer | null: false |

## Association
- belongs_to :users
- has_one :transaction
- has_one :address

## address テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| postalcode | string | null: false |
| prefectures_id | integer | null: false |
| city    | string  | null: false |
| building | string |              |
| phone_number | string | null:false |

## Association
- belongs_to :items
- belongs_to :transaction

##  transactionテーブル   #取引

| Column  | Type    | Options     |
| ------- | ------- | ----------- |
| user_id | integer | null: false |   
| item_id | integer | null: false |

## Association
- belongs_to :users
- belongs_to :items
- has_one :address