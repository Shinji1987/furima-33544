class OrderDeliveryAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city_town, :street_number, :building_name, :phone_number, :order_id, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-) and fill in with 3 leters - 4 letters" }
    validates :prefecture_id, numericality: { other_than: 0 }
    validates :city_town
    validates :street_number
    validates :phone_number, format: { with: /\A\d{11}\z/, message: "is invalid. Exclude hyphen(-) and make it within 11 numbers" }
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    DeliveryAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, city_town: city_town, street_number: street_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end