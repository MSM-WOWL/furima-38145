#テーブル設計

## users テーブル

| Column             | Type    | Options     |
|------------------- | ------- | ----------- |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| nickname           | string  | null: false |
| last_name          | string  | null: false |
| first_name         | string  | null: false |
| last_kana_name     | string  | null: false |
| first_kana_name    | string  | null: false |
| birth_day          | date    | null: false |

### Association

- has many products
- has many comments
- has one delivery 

## products テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| item      | string     | null: false                    |
| price     | integer    | null: false                    |
| explain   | text       | null: false                    |
| category  | string     | null: false                    |
| condition | string     | null: false                    |
| postage   | string     | null: false                    |
| send_area | string     | null: false                    |
| send_day  | string     | null: false                    |
| user      | references | null: false, foreign_key: true |

### Association

- has many comments
- has one delivery
- belongs_to user

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

- belongs_to user
- belongs_to product

## purchases テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| product  | references | null: false, foreign_key: true |
| delivery | references | null: false, foreign_key: true |

### Association

- belongs_to user
- belongs_to product
- belongs_to delivery

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | text       | null: false                    |
| user    | references | null: false, foreign_key: true |
| product | references | null: false, foreign_key: true |

### Association

- belongs_to user
- belongs_to product