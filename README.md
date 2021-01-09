# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------------  | ------ | ----------- |
| nick_name       | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| last_name       | string | null: false |
| first_name      | string | null: false | 
| last_name_kana  | string | null: false |
| first_name_kana | string | null: false |
| birth_day       | date   | null: false |