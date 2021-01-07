## users テーブル

| Column                | Type       | Options     |
| ----------------------| -----------| ----------- |
| nickname              | string     | null: false |
| email                 | string     | null: false |
| encrypted_password    | string     | null: false |
| family_name_kanji     | string     | null: false |
| first_name_kanji      | string     | null: false |
| family_name_kana      | string     | null: false |
| first_name_kana       | string     | null: false |
| birthday              | date       | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column                 | Type       | Options     |
| ---------------------- | ---------- | ----------- |
| name                   | string     | null: false |
| description            | text       | null: false |
| category_id            | integer    | null: false |
| status_id              | integer    | null: false |
| delivery_pay_method_id | integer    | null: false |
| sender_region_id       | integer    | null: false |
| delivery_duration_id   | integer    | null: false |
| price                  | integer    | null: false |
| user                   | references |             |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column            | Type       | Options     |
| ------------------| -----------| ----------- |
| user              | references |             |
| item              | references |             |

### Association

- belongs_to :item
- belongs_to :user
- has_one :delivery_address

## delivery_addresses テーブル

| Column            | Type       | Options     |
| ------------------| -----------| ----------- |
| postal_code       | string     | null: false |
| prefecture_id     | integer    | null: false |
| city_town         | string     | null: false |
| street_number     | string     | null: false |
| building_name     | string     |             |
| phone_number      | string     | null: false |
| purchase          | references |             |

### Association

- belongs_to :order