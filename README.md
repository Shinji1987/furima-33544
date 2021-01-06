## users テーブル

| Column                | Type       | Options     |
| ----------------------| -----------| ----------- |
| nickname              | string     | null: false |
| email                 | string     | null: false |
| password              | string     | null: false |
| password_confirmation | string     | null: false |
| family_name_kanji     | string     | null: false |
| first_name_kanji      | string     | null: false |
| family_name_kana      | string     | null: false |
| first_name_kana       | string     | null: false |
| birthday              | date       | null: false |

### Association

- has_many :items
- has_many :purchases
- belongs_to :delivery_address

## items テーブル

| Column                 | Type       | Options     |
| ---------------------- | ---------- | ----------- |
| item_name              | string     | null: false |
| item_description       | text       | null: false |
| item_category_id       | integer    | null: false |
| item_status_id         | integer    | null: false |
| delivery_pay_method_id | integer    | null: false |
| sender_region_id       | integer    | null: false |
| delivery_duration_id   | integer    | null: false |
| item_price             | integer    | null: false |
| user                   | references |             |

### Association

- belongs_to :user
- belongs_to :delivery_address
- has_one :purchase

## purchases テーブル

| Column            | Type       | Options     |
| ------------------| -----------| ----------- |
| user              | references |             |
| item              | references |             |

### Association

- belongs_to :item
- belongs_to :user
- belongs_to :delivery_address

## delivery_addresses テーブル

| Column            | Type       | Options     |
| ------------------| -----------| ----------- |
| postal_code       | string     | null: false |
| prefecture_id     | integer    | null: false |
| city_town         | string     | null: false |
| street_number     | string     | null: false |
| building_name     | string     |             |
| phone_number      | integer    | null: false |
| user              | references |             |
| item              | references |             |

### Association

- has_one :item
- has_one :user
- has_one :purchase