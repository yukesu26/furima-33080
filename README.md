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

### Association
- has_many :products
- has_many :buys
 


## products テーブル
| Column          | Type      | Options     |
| --------------  | --------- | ----------- |
| item            | string    | null: false |
| item_memo       | string    | null: false |
| category        | string    | null: false |
| image           | string    | null: false |
| item_state      | string    | null: false | 
| delivery_fee    | string    | null: false |
| shipping_place  | string    | null: false |
| send_day        | date      | null: false |
| price           | int       | null: false |            
| user            | reference | null: false, foreign_key: true |

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
 |


### Association 
- has_one :destination
- belongs_to :user
- belongs_to :product