# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ----------------   | ------ | ------------------------- |
| nick_name          | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |  
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birth_day          | date   | null: false               |

### Association
- has_many :products
- has_many :buys
 


## products テーブル
| Column             | Type      | Options     |
| -----------------  | --------- | ----------- |
| name               | string    | null: false |
| memo               | string    | null: false |
| category_id        | integer   | null: false |
| item_state_id      | integer   | null: false | 
| delivery_fee_id    | integer   | null: false |
| shipping_place_id  | integer   | null: false |
| send_day_id        | date      | null: false |
| price              | integer   | null: false |            
| user               | reference | null: false, foreign_key: true |

### Association
- has_many :destinations
- has_many :buys

## destinations テーブル

| Column          | Type      | Options     |
| --------------  | ------    | ----------- |
| post_code       | integer   | null: false |
| prefectures     | string    | null: false |
| city            | string    | null: false |
| address         | integer   | null: false |
| phone_number    | integer   | null: false | 
| building_name   | string    |             |
| product         | reference | null: false, foreign_key: true |


### Association
- belongs_to :product
- belongs_to :buy


## buys テーブル

| Column          | Type      | Options                        |
| --------------- | --------- | ------------------------------ |
| user            | reference | null: false, foreign_key: true |
| product         | reference | null: false, foreign_key: true |
 


### Association 
- has_one :destination
- belongs_to :user
- belongs_to :product