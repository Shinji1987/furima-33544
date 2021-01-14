class Order < ApplicationRecord
  with_options presence: true do
    validates :postal_code
    validates :prefecture_id
    validates :city_town
    validates :street_number
    validates :phone_number
  end
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :item
  belongs_to :user
  has_one    :delivery_address

  
end
