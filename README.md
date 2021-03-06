## usersテーブル

|Column             |Type    |Options      |
|-------------------|--------|-------------|
| nickname          | string | null: false |
| email             | string | null: false unique: true|
| encrypted_password| string | null: false |
| first_name        | string | null: false |
| last_name         | string | null: false |
| kana_first_name   | string | null: false |
| kana_last_name    | string | null: false |
| birthday          | date   | null: false |


### Association
has_many :items  
has_many :buys


##  itemsテーブル

|Column                |Type         |Options      |
|---------------------|-------------|-------------|
| name                | string      | null: false |
| description         | text        | null: false |
| category_id         | integer     | null: false |
| status_id           | integer     | null: false |
| shipping_burden_id  | integer     | null: false |
| shipping_area_id    | integer     | null: false |
| shipping_day_id     | integer     | null: false |
| price               | integer     | null: false |
| user                | reference   | foreign_key: true ｜


### Association
belongs_to :user  
has_one :buy  


## buysテーブル

|Column            |Type         |Options      |
|------------------|-------------|-------------|
| user             | reference   | null: false foreign_key: true |
| item             | reference   | null: false foreign_key: true |


### Association
belongs_to :user  
belongs_to :item  
has_one :consumer_place  　

## consumer_placesテーブル

|Column            |Type         |Options      |
|------------------|-------------|-------------|
| post_number      | string      | null: false |
| prefecture_id    | integer     | null: false |
| city_name        | string      | null: false |
| address          | string      | null: false |
| building_name    | string      |             |
| call_number      | integer     | null: false |
| buy              | reference   | null: false foreign_key: true |

### Association 
belongs_to :buy
