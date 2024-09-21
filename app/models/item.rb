class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee_payer
  belongs_to :shipping_origin
  belongs_to :shipping_day
  

  validates :image, :item_description, :item_price, presence: true
  validates :item_name, presence: true, length: { maximum: 40 }
  validates :item_description, length: { maximum: 1000 }

  validates :category_id, :condition_id, :shipping_fee_payer_id, :shipping_origin_id, :shipping_day_id, numericality: { other_than: 1, message: "can't be blank" } 

end
