require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '内容に問題ない場合' do
      it 'すべての情報があれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'item_nameが空だと保存できないこと' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end

      it 'item_nameが41文字以上では登録できない' do
        @item.item_name = Faker::Lorem.characters(number: 41)
        @item.valid?
        expect(@item.errors.full_messages).to include('Item name is too long (maximum is 40 characters)')
      end

      it 'item_descriptionが空だと保存できないこと' do
        @item.item_description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item description can't be blank")
      end

      it 'item_descriptionが1001文字以上では登録できない' do
        @item.item_description = Faker::Lorem.characters(number: 1001)
        @item.valid?
        expect(@item.errors.full_messages).to include('Item description is too long (maximum is 1000 characters)')
      end

      it 'category_idが空だと保存できないこと' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'condition_idが空だと保存できないこと' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

      it 'shipping_fee_payer_idが空だと保存できないこと' do
        @item.shipping_fee_payer_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee payer can't be blank")
      end

      it 'shipping_origin_idが空だと保存できないこと' do
        @item.shipping_origin_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping origin can't be blank")
      end

      it 'shipping_day_idが空だと保存できないこと' do
        @item.shipping_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank")
      end

      it 'item_priceが空だと保存できないこと' do
        @item.item_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price can't be blank")
      end

      it 'imageが空だと保存できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end

      it 'item_priceが299円以下であれば保存できない' do
        @item.item_price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price must be greater than or equal to 300')
      end

      it 'item_priceが10000000円以上であれば保存できない' do
        @item.item_price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price must be less than or equal to 9999999')
      end

      it 'item_priceが半角数値でないと保存できないこと' do
        @item.item_price = 'あああああ'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price is not a number')
      end

      it 'item_priceが半角数値でないと保存できないこと' do
        @item.item_price = '５５５５５'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price is not a number')
      end

      it 'item_priceが半角数値でないと保存できないこと' do
        @item.item_price = 'aaaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price is not a number')
      end
    end
  end
end
