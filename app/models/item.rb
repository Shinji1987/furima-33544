class Item < ApplicationRecord
  validates :image, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, presence: true
  validates :category_id, numericality: { other_than: 1 }
  validates :status_id, presence: true
  validates :status_id, numericality: { other_than: 1 }
  validates :delivery_pay_method_id, presence: true
  validates :delivery_pay_method_id, numericality: { other_than: 1 }
  validates :sender_region_id, presence: true
  validates :sender_region_id, numericality: { other_than: 1 }
  validates :delivery_duration_id, presence: true
  validates :delivery_duration_id, numericality: { other_than: 1 }
  validates :price, presence: true
  validates :price, numericality: {
    greater_than_or_equal_to: 300,
    less_than_or_equal_to: 9_999_999
    # :message => '入力値が5~10の範囲外です'
  }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_pay_method
  belongs_to :sender_region
  belongs_to :delivery_duration
  has_one_attached :image
  belongs_to :user
end
