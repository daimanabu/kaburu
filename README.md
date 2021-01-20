# テーブル設計

## users テーブル

| Column   | Type   | Options                   |
| -------- | ------ | ------------------------- |
| email    | string | null: false               |
| password | string | null: false               |
| name     | string | null: false, unique: true |

### Association

- has_many :posts
- has_many :comments

## posts テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| title      | string     | null: false                    |
| catch_copy | text       | null: false                    |
| concept    | text       | null: false                    |
| user       | references | null: false, foreign_key: true |

### Association

- has_many :comments
- belongs_to :users

## comments テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| text   | text       | null: false                    |
| user   | references | null: false, foreign_key: true |
| post   | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :posts
