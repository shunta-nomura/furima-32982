## userテーブル

|Column            |Type    |Options      |
|------------------|--------|-------------|
| nickname         | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| first_name       | string | null: false |
| last_name        | string | null: false |
| kana_first_name  | string | null: false |
| kana_last_name   | string | null: false |
| year             | string | null: false |
| month            | string | null: false |
| day              | string | null: false |


### Association
has_many :items  
has_many :buys  


##  itemテーブル

|Column            |Type         |Options      |
|------------------|-------------|-------------|
| name             | string      | null: false |
| description      | string      | null: false |
| category         | string      | null: false |
| Status           | string      | null: false |
| shipping_burden  | string      | null: false |
| shipping_area    | string      | null: false |
| shipping_day     | string      | null: false |
| price            | string      | null: false |
| month            | string      | null: false |
| user_id          | string      | null: false |
| image            | activestrage| null: false |


### Association
belongs_to :user  
has_one :buy  

## buy

|Column            |Type         |Options      |
|------------------|-------------|-------------|
| post_number      | string      | null: false |
| prefecture       | string      | null: false |
| city_name        | string      | null: false |
| address          | string      | null: false |
| building_name    | string      | null: false |
| call_number      | string      | null: false |
| consumer_user_id | string      | null: false |
| item_id          | string      | null: false |


### Association
belongs_to :user  
has_one :item  
