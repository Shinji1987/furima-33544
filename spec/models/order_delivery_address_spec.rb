require 'rails_helper'
RSpec.describe OrderDeliveryAddress, type: :model do
  before do
    @order_delivery_address = FactoryBot.build(:order_delivery_address)
  end

  describe '商品の購入' do
    context '商品の購入ができる場合' do
      it '必要な情報を適切に入力すると,商品の購入ができること' do
        expect(@order_delivery_address).to be_valid
      end
    end

    context '商品の購入ができない場合' do
      it '郵便番号を入力しないと購入できない' do
        @order_delivery_address.postal_code = ''
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号にハイフンを含めないと購入できない' do
        @order_delivery_address.postal_code = '2380048'
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-) and fill in with 3 leters - 4 letters')
      end
      it '郵便番号の前半部分が３文字出ないと購入できない' do
        @order_delivery_address.postal_code = '22-0048'
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-) and fill in with 3 leters - 4 letters')
      end
      it '郵便番号の後半部分が４文字出ないと購入できない' do
        @order_delivery_address.postal_code = '238-048'
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-) and fill in with 3 leters - 4 letters')
      end
      it '都道府県を入力しないと購入できない' do
        @order_delivery_address.prefecture_id = nil
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '都道府県の選択肢で「--」以外を選択しないと購入できない' do
        @order_delivery_address.prefecture_id = 0
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include('Prefecture must be other than 0')
      end
      it '市区町村を入力しないと購入できない' do
        @order_delivery_address.city_town = ''
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("City town can't be blank")
      end
      it '番地を入力しないと購入できない' do
        @order_delivery_address.street_number = ''
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("Street number can't be blank")
      end
      it '電話番号を入力しないと購入できない' do
        @order_delivery_address.phone_number = ''
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号にハイフンを含めると購入できない' do
        @order_delivery_address.phone_number = '090-222-811'
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include('Phone number is invalid. Exclude hyphen(-) and make it within 11 numbers')
      end
      it '電話番号が11文字より多いと購入できない' do
        @order_delivery_address.phone_number = '090111111111'
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include('Phone number is invalid. Exclude hyphen(-) and make it within 11 numbers')
      end
      it 'クレジットカード情報を正しく入力しないと購入できない' do
        @order_delivery_address.token = ''
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
