require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品できるとき' do
      it 'image,items_name,explanation,category_id,situation_id,delivery_charge_id,
         prefecture_id,days_to_ship_id,price,userが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '商品出品できないとき' do
      it 'nicknameが空では登録できない' do
        @item.image = nil 
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'items_nameが空では登録できない' do
        @item.items_name = "" 
        @item.valid?
        expect(@item.errors.full_messages).to include("Items name can't be blank")
      end

      it 'explanationが空では登録できない' do
        @item.explanation = "" 
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end

      it 'categoryが空では登録できない' do
        @item.category_id = "" 
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'situationが空では登録できない' do
        @item.situation_id = "" 
        @item.valid?
        expect(@item.errors.full_messages).to include("Situation can't be blank")
      end

      it 'delivery_chargeが空では登録できない' do
        @item.delivery_charge_id = "" 
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
      end

      it 'prefectureが空では登録できない' do
        @item.prefecture_id = "" 
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'days_to_shipが空では登録できない' do
        @item.days_to_ship_id = "" 
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to ship can't be blank")
      end

      it 'priceが空では登録できない' do
        @item.price = "" 
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '価格が300未満では登録できない' do
        @item.price = 299 
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it '価格が9,999,999より大きい登録できない' do
        @item.price = 10000000 
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end

      it '数値が半角数字でないと登録できない' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

    end
  end
end
