require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @user = FactoryBot.build(:user)
    @product = FactoryBot.build(:product)
    @order = FactoryBot.build(:order, user_id: @user, product_id: @product)
  end

  describe '商品購入' do
    context '商品購入できる場合' do
      it '全ての項目が存在すれば購入できる' do
        expect(@order).to be_valid
      end
      it 'buildingの項目が存在しなくても購入できる' do
        @order.building = ''
        expect(@order).to be_valid
      end
    end

    context '商品購入できない場合' do
      it 'postal_codeが空では購入できない' do
        @order.postal_code = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'send_area_idが空では購入できない' do
        @order.send_area_id = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Send area can't be blank")
      end
      it 'municipalitiesが空では購入できない' do
        @order.municipalities = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Municipalities can't be blank")
      end
      it 'addressが空では購入できない' do
        @order.address = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空では購入できない' do
        @order.phone_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'user_idが空では購入できない' do
        @order.user_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("User can't be blank")
      end
      it 'product_idが空では購入できない' do
        @order.product_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Product can't be blank")
      end
      it 'tokenが空では購入できない' do
        @order.token = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeはハイフンを含めなければ購入できない' do
        @order.postal_code = '1234567'
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code is invalid")
      end
      it 'postal_codeが全角数字では購入できない' do
        @order.postal_code = '１２３-４５６７'
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code is invalid")
      end
      it 'send_area_id = 1 では購入できない' do
        @order.send_area_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include("Send area can't be blank")
      end
      it 'phone_numberが10桁より少ないと購入できない' do
        @order.phone_number = '080123456'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが11桁より多いと購入できない' do
        @order.phone_number = '080123456789'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberにハイフンを含めると購入できない' do
        @order.phone_number = '080-1234-5678'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが全角数字では購入できない' do
        @order.phone_number = '０８０１２３４５６７８'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid")
      end
    end
  end
end
