#テーブル設計

## users テーブル

| Column             | Type    | Options                   |
|------------------- | ------- | ------------------------- |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| nickname           | string  | null: false               |
| last_name          | string  | null: false               |
| first_name         | string  | null: false               |
| last_kana_name     | string  | null: false               |
| first_kana_name    | string  | null: false               |
| birth_day          | date    | null: false               |

### Association

- has_many :products
- has_many :purchases 

## products テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| item         | string     | null: false                    |
| price        | integer    | null: false                    |
| explain      | text       | null: false                    |
| category_id  | integer    | null: false                    |
| condition_id | integer    | null: false                    |
| postage_id   | integer    | null: false                    |
| send_area_id | integer    | null: false                    |
| send_day_id  | integer    | null: false                    |
| user         | references | null: false, foreign_key: true |

### Association

- has_one :purchase
- belongs_to :user

## deliveries テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postal_code    | string     | null: false                    |
| send_area_id   | integer    | null: false                    |
| municipalities | string     | null: false                    |
| address        | string     | null: false                    |
| building       | string     |                                |
| phone_number   | string     | null: false                    |
| purchase       | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase

## purchases テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| product  | references | null: false, foreign_key: true |

### Association

- has_many :deliveries
- belongs_to :user
- belongs_to :product

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | text       | null: false                    |
| user    | references | null: false, foreign_key: true |
| product | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product