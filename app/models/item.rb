class Item < ApplicationRecord
  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :category_id
    validates :status_id
    validates :delivery_pay_method_id
    validates :sender_region_id
    validates :delivery_duration_id
    validates :price
  end
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :delivery_pay_method_id
    validates :sender_region_id
    validates :delivery_duration_id
  end
  validates :price, numericality: {
    greater_than_or_equal_to: 300,
    less_than_or_equal_to: 9_999_999
  }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_pay_method
  belongs_to :sender_region
  belongs_to :delivery_duration
  has_one_attached :image
  belongs_to :user
  has_one :order
end
