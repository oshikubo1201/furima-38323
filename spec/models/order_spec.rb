require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    item = FactoryBot.create(:item)
    @order = FactoryBot.build(:order, user_id: item.user.id, item_id: item.id)
  end

  describe '商品購入機能' do
    context '商品購入できるとき' do
      it 'post_code, prefecture_id, municipalitie, address, building, telephone, user_id, item_id,token が存在すれば登録できる' do
        expect(@order).to be_valid
      end
      it 'buildingが空でも登録できる' do
        @order.building = "" 
        expect(@order).to be_valid
      end

    end
    context '商品出品できないとき' do
      it 'post_codeが空では登録できない' do
        @order.post_code = "" 
        @order.valid?
        expect(@order.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeに「-」がないと登録できない' do
        @order.post_code = "1000000" 
        @order.valid?
        expect(@order.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end

      it 'prefecture_idが「---」では登録できない' do
        @order.prefecture_id = 1 
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'municipalitieが空では登録できない' do
        @order.municipalitie = "" 
        @order.valid?
        expect(@order.errors.full_messages).to include("Municipalitie can't be blank")
      end
      it 'addressが空では登録できない' do
        @order.address = "" 
        @order.valid?
        expect(@order.errors.full_messages).to include("Address can't be blank")
      end
      it 'telephoneが空では登録できない' do
        @order.telephone = "" 
        @order.valid?
        expect(@order.errors.full_messages).to include("Telephone can't be blank")
      end
      it 'telephoneが12桁以上では登録できない' do
        @order.telephone = 901234567890 
        @order.valid?
        expect(@order.errors.full_messages).to include("Telephone is invalid")
      end
      it 'telephoneが9桁以下では登録できない' do
        @order.telephone = 901234560 
        @order.valid?
        expect(@order.errors.full_messages).to include("Telephone is invalid")
      end
      it 'telephoneが半角数字でないと登録できない' do
        @order.telephone = "９０１２３４５６７８" 
        @order.valid?
        expect(@order.errors.full_messages).to include("Telephone is invalid")
      end
      it "tokenが空では登録できないこと" do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end



    end




  end
end
