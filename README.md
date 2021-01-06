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
| birthday_year_id      | integer    | null: false |
| birthday_month_id     | integer    | null: false |
| birthday_day_id       | integer    | null: false |

### Association

- has_many :items
- has_many :purchases

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
| user_id                | references |             |

### Association

- belongs_to :user
- has_one :purchase

## purchases テーブル

| Column            | Type       | Options     |
| ------------------| -----------| ----------- |
| card_number       | integer    | null: false |
| card_expiry_month | integer    | null: false |
| card_expiry_year  | integer    | null: false |
| security_code     | integer    | null: false |
| postal_code       | string     | null: false |
| prefecture        | references | null: false |
| city_town         | string     | null: false |
| street_number     | string     | null: false |
| building_name     | string     |             |
| phone_number      | integer    | null: false |
| user_id           | references |             |
| item_id           | references |             |

### Association

- belongs_to :item
- belongs_to :user
