class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee_payer
  belongs_to :shipping_origin
  belongs_to :shipping_day
  

  validates :image,:item_name, :item_description, :item_price: true

  validates :category_id, :condition_id, :shipping_fee_payer_id, :shipping_origin_id, :shipping_day_id, numericality: { other_than: 1, message: "can't be blank" } 

end
