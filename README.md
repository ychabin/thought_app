## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false |
| password           | string | null: false |
| name               | string | null: false |

has_many :thoughts
has_many :comments

## thought テーブル

| Column             | Type       | Options            |
| ------------------ | ---------- | ------------------ |
| title              | string     | null: false        |
| content            | text       | null: false        |
| user               | references | foreign_key: true  |

belongs_to :user
has_many :comments

## comments テーブル

| Column      | Type       | Options           |
| ----------- | ---------- | ----------------- |
| comment     | text       | null: false       |
| user        | references | foreign_key: true |
| item        | references | foreign_key: true |

belongs_to :user
belongs_to :item
has_many :comment_goods
has_many :goods, through: :comment_goods

## goods テーブル

| Column        | Type       | Options           |
| ------------- | ---------- | ----------------- |
| user          | references | foreign_key: true |
| thought       | references | foreign_key: true |
| comment       | references | foreign_key: true |

belongs_to :user
belongs_to :comment
has_many :comment_goods
has_many :comments, through: :comment_goods

## comment_goods テーブル

| Column        | Type       | Options           |
| ------------- | ---------- | ----------------- |
| comment       | references | foreign_key: true |
| good          | references | foreign_key: true |

belongs_to :comment
belongs_to :good