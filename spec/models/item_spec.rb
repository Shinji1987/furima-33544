require 'rails_helper'
RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('app/assets/images/Yokosuka.jpg')
    end

    describe '商品の出品' do
      context '商品の出品ができる場合' do
        it '必要な情報を適切に入力すると,商品の出品ができること' do
          expect(@item).to be_valid
        end
      end

      context '商品の出品ができない場合' do
        it '商品画像を1枚つけないと出品できない' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end
        it '商品名を入力しないと出品できない' do
          @item.name = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Name can't be blank")
        end
        it '商品の説明を入力しないと出品できない' do
          @item.description = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Description can't be blank")
        end
        it '商品のカテゴリーを選択しないと出品できない' do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Category must be other than 1')
        end
        it '商品のカテゴリーが空だと出品できない' do
          @item.category_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Category can't be blank")
        end
        it '商品の状態を選択しないと出品できない' do
          @item.status_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Status must be other than 1')
        end
        it '商品の状態が空だと出品できない' do
          @item.status_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Status can't be blank")
        end
        it '商品の配送料の負担を選択しないと出品できない' do
          @item.delivery_pay_method_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Delivery pay method must be other than 1')
        end
        it '商品の配送料の負担が空だと出品できない' do
          @item.delivery_pay_method_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Delivery pay method can't be blank")
        end
        it '商品の発送元の地域を選択しないと出品できない' do
          @item.sender_region_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Sender region must be other than 1')
        end
        it '商品の発送元の地域が空だと出品できない' do
          @item.sender_region_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Sender region can't be blank")
        end
        it '商品の発送までの日数を選択しないと出品できない' do
          @item.delivery_duration_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Delivery duration must be other than 1')
        end
        it '商品の発送までの日数が空だと出品できない' do
          @item.delivery_duration_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Delivery duration can't be blank")
        end
        it '商品の価格を入力しないと出品できない' do
          @item.price = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end
        it '商品の価格が¥300未満だと出品できない' do
          @item.price = 100
          @item.valid?
          expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
        end
        it '商品の価格が¥9,999,999より上だと出品できない' do
          @item.price = 10_000_000
          @item.valid?
          expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
        end
        it '商品の価格は半角数字以外だと出品できない' do
          @item.price = '１０００'
          @item.valid?
          expect(@item.errors.full_messages).to include('Price is not a number')
        end
        it '商品の価格は半角英語だけだと出品できない' do
          @item.price = 'abcde'
          @item.valid?
          expect(@item.errors.full_messages).to include('Price is not a number')
        end
        it '商品の価格は半角英数混合だと出品できない' do
          @item.price = 'abc123'
          @item.valid?
          expect(@item.errors.full_messages).to include('Price is not a number')
        end
        it '商品の価格は全角文字だと出品できない' do
          @item.price = 'あいうえお'
          @item.valid?
          expect(@item.errors.full_messages).to include('Price is not a number')
        end
      end
    end
  end
end
