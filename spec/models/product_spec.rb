require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end

  describe '商品新規出品' do
    context '新規出品できる場合' do
      it '全ての項目が存在すれば出品できる' do
        expect(@product).to be_valid
      end
    end

    context '新規出品できない場合' do
      it 'itemが空では出品できない' do
        @product.item = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Item can't be blank")
      end
      it 'priceが空では出品できない' do
        @product.price = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end
      it 'explainが空では出品できない' do
        @product.explain = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Explain can't be blank")
      end
      it 'category_idが空では出品できない' do
        @product.category_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Category can't be blank")
      end
      it 'condition_idが空では出品できない' do
        @product.condition_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Condition can't be blank")
      end
      it 'postage_idが空では出品できない' do
        @product.postage_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Postage can't be blank")
      end
      it 'send_area_idが空では出品できない' do
        @product.send_area_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Send area can't be blank")
      end
      it 'send_day_idが空では出品できない' do
        @product.send_day_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Send day can't be blank")
      end
      it 'imageが空では出品できない' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end
      it 'userが空では出品できない' do
        @product.user = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("User must exist")
      end
      it 'category_id = 1 の場合は出品できない' do
        @product.category_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Category can't be blank")
      end
      it 'condition_id = 1 の場合は出品できない' do
        @product.condition_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Condition can't be blank")
      end
      it 'postage_id = 1 の場合は出品できない' do
        @product.postage_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Postage can't be blank")
      end
      it 'send_area_id = 1 の場合は出品できない' do
        @product.send_area_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Send area can't be blank")
      end
      it 'send_day_id = 1 の場合は出品できない' do
        @product.send_day_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Send day can't be blank")
      end
      it 'priceが300以下の場合は出品できない' do
        @product.price = 299
        @product.valid?
        expect(@product.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it 'priceが9,999,999以上の場合は出品できない' do
        @product.price = 10000000
        @product.valid?
        expect(@product.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it 'priceが全角の場合は出品できない' do
        @product.price = '３０００'
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is not a number")
      end
    end
  end
end