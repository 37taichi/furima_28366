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
- has_many :item_purchases

## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |
| text   | text    | null: false |
| category| integer | null: false |
| status | integer  | null: false |
| image  |  text   | null: false |
| price  | integer | null: false |
| shipping_day | integer | null: false |
| shipping_origin | integer | null: false |
| delivery_fee | integer | null: false |
| user | references | null: false, foregin_key:true |

## Association
- belongs_to :user
- has_one :item_purchase

## address テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| postalcode | string | null: false |
| prefectures_id | integer | null: false |
| city    | string  | null: false |
| building | string |              |
| address | string | null: false |
| phone_number | string | null:false |
| item_purchases | references | null: false, foregin_key: true |

## Association
- belongs_to :item_purchase

##  item_purchasesテーブル   #取引

| Column  | Type    | Options     |
| ------- | ------- | ----------- |
| user | references | null: false, foregin_key: true|   
| item | references | null: false, foregin_key: true |

## Association
- belongs_to :user
- belongs_to :item
- has_one :address