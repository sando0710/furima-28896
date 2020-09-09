# DB設計

## users table (ユーザー情報)

|     Column      |  Type  |   Options             |
|-----------------|--------|-----------------------|
| mail            | string | unique:true,index:true|
| password        | string | null: false           |
| nickname        | string | null: false           |
| first_name      | string | null: false           |
| last_name       | string | null: false           |
| first_name_kana | string | null: false           |
| last_name_kana  | string | null: false           |
| birth_day       | date   | null: false           |

### Association

- has_many :items,dependents::destroy
- has_many :exchanges,dependents::destroy


## items table (商品情報)

|    Column        | Type      | Options                      |
|------------------|-----------|------------------------------|
| user_id          | integer   | foreign_key:true             |
| name             | string    | null: false                  |
| introduction     | text      | null: false                  |
| category         | integer   | null: false                  |
| condition        | integer   | null: false                  |
| delivery_burden  | integer   | null: false                  |
| prefecture_code  | integer   | null: false                  |
| prepare_day      | integer   | null: false                  |
| price            | integer   | null: false                  |

### Association

- belongs_to :user
- belongs_to_active_hash :category
- belongs_to_active_hash :condition
- belongs_to_active_hash :delivery_burden
- belongs_to_active_hash :prepare_day
- belongs_to_active_hash :prefecture
- has_one :exchange

## exchanges (購入管理情報)

|    Column        | Type      | Options                      |
|------------------|-----------|------------------------------|
| user_id          | integer   | foreign_key:true             |
| item_id          | integer   | foreign_key:true             |


### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping

## shippings (配送先情報)

|    Column        | Type      | Options                      |
|------------------|-----------|------------------------------|
| exchanges_id     | integer   | foreign_key:true             |
| post_code        | string    | null: false                  |
| prefecture_code  | integer   | null: false                  |
| city             | string    | null: false                  | 
| address          | string    | null: false                  |
| building         | string    |                              |
| phone_number     | string    | null: false                  |
### Association 

- belongs_to :exchange
- belongs_to_active_hash :prefecture