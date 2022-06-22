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
- has_many :comments
- has_one :delivery 

## products テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| item         | string     | null: false                    |
| price        | integer    | null: false                    |
| explain      | text       | null: false                    |
| category_id  | string     | null: false                    |
| condition_id | string     | null: false                    |
| postage_id   | string     | null: false                    |
| send_area_id | string     | null: false                    |
| send_day_id  | string     | null: false                    |
| user         | references | null: false, foreign_key: true |

### Association

- has_many :comments
- has_one :delivery
- belongs_to :user

## deliveries テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postal_code    | integer    | null: false                    |
| prefecture     | string     | null: false                    |
| municipalities | string     | null: false                    |
| address        | string     | null: false                    |
| building       | string     |                                |
| phone_number   | integer    | null: false                    |
| user           | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product

## purchases テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| product  | references | null: false, foreign_key: true |
| delivery | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product
- belongs_to :delivery

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | text       | null: false                    |
| user    | references | null: false, foreign_key: true |
| product | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product