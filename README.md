## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| first_name     | string | null: false |
| family_name     | string | null: false |
| first_name_kana     | string | null: false |
| family_name_kana     | string | null: false |
| nickname | string | null: false |
| password | string | null: false |
| birthday | integer| null: false |
| email    | string | null: false |

## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| itemname| string | null: false |
| text   | text    | null: false |
| category| string | null: false |
| status | string  | null: false |
| image  |  text   | null: false |
| price  | integer | null: false |

## address テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| postalcode | integer | null: false |
| prefectures | string | null: false |
| city    | string  | null: false |
| building | string | null: false |
|phonenumber | integer | null:false

## buyer テーブル

| Column  | Type       | Options        |
| ------- | ---------- | -------------- |
