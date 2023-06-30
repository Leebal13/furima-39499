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

| Column    | Type    | Options             |
| --------- | ------- | ------------------- |
| email     | string  | null: false, unique |
| id        | integer | null: primary key   |
| nickname  | string  | null: false         |
| password  | string  | null: false         |
| name      | string  | null: false         |
| kana_name | string  | null: false         |
| birthdate | date    | null: false         |

### Association

- has_many :purchases
- has_many :items
- has_one :addresses

## items

| Column           | Type    | Options                  |
| ---------------- | ------- | ------------------------ |
| id               | integer | null: false, primary key |
| item_name        | string  | null: false              |
| description      | text    | null: false              |
| detail_category  | string  | null: false              |
| detail_condition | string  | null: false              |
| delivery_format  | string  | null: false              |
| region           | string  | null: false              |
| days             | string  | null: false              |
| price            | integer | null: false              |
| retailer         | string  | null: false              |

- belongs_to :users
- has_one :addresses

## addresses

| Column       | Type     | Options                  |
| ------------ | -------- | ------------------------ |
| id           | integer  | null: false, primary key |
| postal_code  | string   | null: false              |
| region       | string   | null: false              |
| prefecture   | string   | null: false              |
| address_no   | string   | null: false              |
| building_no  | string   |                          |
| phone_number | string   | null: false              |
| created_at   | datetime | null: false              |
| updated_at   | datetime | null: false              |

- belongs_to :items
- belongs_to :users
- belongs_to :purchases

## purchases

| Column | Type    | Options                  |
| ------ | ------- | ------------------------ |
| id     | integer | null: false, primary key |
| buyer  | string  | null: false              |

- belongs_to :users
- has_one :addresses

（ここに追記していく）
