# テーブル設計

## users

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| nickname           | string | null: false               |
| encrypted_password | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| kana_first_name    | string | null: false               |
| kana_last_name     | string | null: false               |
| birthdate          | date   | null: false               |

- has_many :purchases
- has_many :items

## items

| Column              | Type       | Options     |
| ------------------- | ---------- | ----------- |
| item_name           | string     | null: false |
| description         | text       | null: false |
| detail_category_id  | integer    | null: false |
| detail_condition_id | integer    | null: false |
| delivery_format_id  | integer    | null: false |
| region_id           | integer    | null: false |
| days_id             | integer    | null: false |
| price               | integer    | null: false |
| user                | references | null: false |

- belongs_to :user
- has_many :purchases

## addresses

| Column       | Type    | Options     |
| ------------ | ------- | ----------- |
| postal_code  | string  | null: false |
| region_id    | integer | null: false |
| city         | string  | null: false |
| address_no   | string  | null: false |
| building_no  | string  |             |
| phone_number | string  | null: false |

- belongs_to :purchase

## purchases

| Column | Type       | Options     |
| ------ | ---------- | ----------- |
| user   | references | null: false |
| item   | references | null: false |

- belongs_to :user
- has_one :address
- belongs_to :item

（ここに追記していく）
