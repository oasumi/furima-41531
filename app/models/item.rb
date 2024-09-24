class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee_payer
  belongs_to :shipping_origin
  belongs_to :shipping_day

  validates :image, :item_price, presence: true
  validates :item_name, presence: true, length: { maximum: 40 }
  validates :item_description, presence: true, length: { maximum: 1000 }

  validates :category_id, :condition_id, :shipping_fee_payer_id, :shipping_origin_id, :shipping_day_id,
            numericality: { other_than: 1, message: "can't be blank" }

  with_options presence: true, format: { with: /\A\d+\z/, message: 'は半角数字のみを入力してください' } do
    validates :item_price, presence: true,
                           numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end
end
