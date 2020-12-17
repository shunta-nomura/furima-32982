## userテーブル

|Column             |Type    |Options      |
|-------------------|--------|-------------|
| nickname          | string | null: false |
| email             | string | null: false |
| encrypted_password| string | null: false |
| first_name        | string | null: false |
| last_name         | string | null: false |
| kana_first_name   | string | null: false |
| kana_last_name    | string | null: false |
| year              | date   | null: false |
| month             | date   | null: false |
| day               | date   | null: false |


### Association
has_many :items  
has_many :buys


##  itemテーブル

|Column            |Type         |Options      |
|------------------|-------------|-------------|
| name             | string      | null: false |
| description      | text        | null: false |
| category         | string      | null: false |
| Status           | string      | null: false |
| shipping_burden  | integer     | null: false |
| shipping_area    | integer     | null: false |
| shipping_day     | integer     | null: false |
| price            | integer     | null: false |
| user_id          | integer     | null: false foreign_key: true |


### Association
belongs_to :user  
has_one :buy  


## buy

|Column            |Type         |Options      |
|------------------|-------------|-------------|
| consumer_user_id | integer     | null: false foreign_key: true |
| item_id          | integer     | null: false foreign_key: true |
| consumer_place_id| integer     | null: false foreign_key: true |


### Association
belongs_to :user  
has_one :item  
has_one :consumer_place  　

## consumer_place

|Column            |Type         |Options      |
|------------------|-------------|-------------|
| post_number      | string      | null: false |
| prefecture       | string      | null: false |
| city_name        | string      | null: false |
| address          | string      | null: false |
| building_name    | string      | null: false |
| call_number      | string      | null: false |
| consumer_user_id | integer     | null: false foreign_key: true |


### Association 
has_one :buy
