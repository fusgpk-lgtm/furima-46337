## users

| Column          | Type   | Options     |
|-----------------|--------|-------------|
| nickname        | string | null: false |
| email           | string | null: false, unique: true |
| password        | string | null: false |
| last_name       | string | null: false |
| first_name      | string | null: false |
| kana_last_name  | string | null: false |
| kana_first_name | string | null: false |
| birthday        | date   | null: false |


### Association
has_many :items
has_many :purchase_records

## items

| Column          | Type    | Options     |
|-----------------|---------|-------------|
| item_name       | string  | null: false |
| explanation     | text    | null: false |
| category_id     | integer | null: false |
| state_id        | integer | null: false |
| delivery_charge_id | integer | null: false |
| ship_from_id    | integer | null: false |
| ship_day_id     | integer | null: false |
| price           | integer | null: false |
| user            | references | foreign_key: true |

### Association
belongs_to :user
has_one :purchase_record

## purchase_records

| Column          | Type       | Options           |
|-----------------|------------|-------------------|
| user            | references | foreign_key: true |
| item            | references | foreign_key: true |

### Association
belongs_to :user
belongs_to :item
has_one :shopping_information

## shopping_information

| Column          | Type    | Options     |
|-----------------|---------|-------------|
| post_number     | integer | null: false |
| prefecture      | string  | null: false |
| city            | string  | null: false |
| house_number    | integer | null: false |
| house_name      | string  | null: false |
| phone_number    | integer | null: false |

### Association
belongs_to :purchase_record