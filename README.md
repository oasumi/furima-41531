# DB設計

## users テーブル
 
| Column                | Type      | Options                          |
| --------------------- | --------- | ---------------------------------|
| nickname              | string    | null: false                      |
| email                 | string    | null: false, unique: true        |
| encrypted_password    | string    | null: false                      |
| last_name             | string    | null: false                      |
| first_name            | string    | null: false                      |
| last_name_kana        | string    | null: false                      |
| first_name_kana       | string    | null: false                      |
| birth_date            | string    | null: false                      |

### Association

- has_many :items
- has_many :orders


## items テーブル

| Column                  | Type          | Options                          |
| ----------------------- | ------------- | -------------------------------- |
| item_name               | string        | null: false                      |
| item_description        | text          | null: false                      |
| category_id             | integer       | null: false                      |
| condition_id            | integer       | null: false                      |
| shipping_fee_payer_id   | integer       | null: false                      |
| shipping_origin_id      | integer       | null: false                      |
| shipping_days_id        | integer       | null: false                      |
| item_price              | decimal       | null: false                      |
| user_id                 | references    | null: false, foreign_key: true   |

### Association

- belongs_to :user
- has_one :order


## orders テーブル

| Column      | Type          | Options                                |
| ----------- | ------------- | -------------------------------------- |
| user_id     | references    | null: false, foreign_key: true         |
| item_id     | references    | null: false, foreign_key: true         |

### Association

- belongs_to :item
- belongs_to :user
- has_one :shipping_address


## shipping_addressesテーブル

| Column              | Type          | Options                          |
| ------------------- | ------------- | -------------------------------- |
| postal_code         | string        | null: false                      |
| prefecture_id       | integer       | null: false                      |
| city                | string        | null: false                      |
| street_address      | string        | null: false                      |
| building_name       | string        |                                  |
| phone_number        | string        | null: false                      |
| order_id            | references    | null: false, foreign_key: true   |

### Association

- belongs_to :order

