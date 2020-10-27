# README

#　テーブル設計

##　users　テーブル

| Column   | Type   | Options                  |
| -------- | ------ | ------------------------ |
| email    | string | null: false unique: true |
| password | string | null: false              |
| usernam  | string | null: false              |

### Association

- has_many :comments

##　care_users　テーブル

| Column  | Type   | Options     |
| ------- | ------ | ----------- |
| name    | string | null: false |

### Association

- has_many :schedules

##　schedules　テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| title            | string     | null: false                    |
| text             | string     | null: false                    |
| times_id         | integer    | null: false                    |
| care_user        | references | null: false, foreign_key: true |

### Association

- belongs_to :care_user
- has_many :comments

##　comments　テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| text             | string     | null: false                    |
| user             | references | null: false, foreign_key: true |
| schedule         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belomgs_to :schedule