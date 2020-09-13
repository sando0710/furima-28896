require 'rails_helper'

RSpec.describe ExchangeS, type: :model do
  before do
    @exchange_s = FactoryBot.build(:exchange_s)
  end

  describe '出品商品の購入' do
    context '購入がうまくいくとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@exchange_s).to be_valid
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式であると保存できること' do
        @exchange_s.post_code = '123-4567'
        expect(@exchange_s).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @exchange_s.building= ''
        expect(@exchange_s).to be_valid
      end
      it 'prefecture0を選んでなければ保存できないこと' do
        @exchange_s.prefecture = '1'
        expect(@exchange_s).to be_valid
      end
    end
  end
  describe '出品商品の購入' do
    context '購入がうまくいかないとき' do
      it 'post_codeが空では保存できないこと' do
        @exchange_s.post_code = ''
        @exchange_s.valid?
        expect(@exchange_s.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが半角のハイフンを含んでないと保存できないこと' do
        @exchange_s.post_code = '1234567'
        @exchange_s.valid?
        expect(@exchange_s.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it 'prefectureを0を選択すると保存できないこと' do
        @exchange_s.prefecture = '0'
        @exchange_s.valid?
        expect(@exchange_s.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと保存できないこと' do
        @exchange_s.city = ''
        @exchange_s.valid?
        expect(@exchange_s.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空だと保存できないこと' do
        @exchange_s.address = ''
        @exchange_s.valid?
        expect(@exchange_s.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @exchange_s.phone_number = ''
        @exchange_s.valid?
        expect(@exchange_s.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが11桁以上だと保存できないこと' do
        @exchange_s.phone_number = '080111122223'
        @exchange_s.valid?
        expect(@exchange_s.errors.full_messages).to include('Phone number is invalid')
      end
      it 'tokenが空だと保存できないこと' do
        @exchange_s.token = ''
        @exchange_s.valid?
        expect(@exchange_s.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
