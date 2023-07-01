<!-- # README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ... -->

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

### Association

## items

| Column              | Type       | Options     |
| ------------------- | ---------- | ----------- |
| item_name           | string     | null: false |
| description         | text       | null: false |
| detail_category_id  | integer    | null: false |
| detail_condition_id | integer    | null: false |
| delivery_format_id  | integer    | null: false |
| region_id           | integer    | null: false |
| days                | string     | null: false |
| delivery_date       | date       | null: false |
| price               | integer    | null: false |
| user_id             | references | null: false |

- belongs_to :user

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

| Column  | Type    | Options     |
| ------- | ------- | ----------- |
| user_id | integer | null: false |
| item_id | integer | null: false |

- belongs_to :user
- has_one :address
- belongs_to :item

（ここに追記していく）
