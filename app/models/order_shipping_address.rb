class OrderShippingAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :shipping_origin_id, :city, :street_address, :building_name,
                :phone_number, :user_id, :item_id, :order_id, :token

  validates :token, presence: true

  with_options presence: true do
    validates :city, :street_address, :phone_number, :user_id, :item_id
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :phone_number, presence: true, format: { with: /\A\d{10,11}\z/ }
  end

  validates :shipping_origin_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    # 購入記録を保存し、変数orderに代入する
    order = Order.create(user_id:, item_id:)
    # 配送先の住所を保存する
    # order_idには、変数orderのidと指定する
    ShippingAddress.create(postal_code:, shipping_origin_id:, city:,
                           street_address:, building_name:, phone_number:, order_id: order.id)
  end
end
