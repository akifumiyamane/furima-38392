require 'rails_helper'

RSpec.describe DonationAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @donation_address = FactoryBot.build(:donation_address, user_id: user.id, item_id: item.id)
  end
  
  describe '商品購入' do
    context '商品購入できる時' do
      it '全ての値が正しく入力されていれば購入できること' do
        expect(@donation_address).to be_valid
      end
      it 'buildingは空でも購入できる' do
        expect(@donation_address).to be_valid
      end  
    end
    context '商品購入できない時' do
      it 'codeが空では購入できない' do
        @donation_address.code = nil
        @donation_address.valid?
        expect(@donation_address.errors.full_messages).to include("Code can't be blank", "Code is invalid. Include hyphen(-)")  
      end
      it 'prefecture_idが未選択だと購入できない' do
        @donation_address.prefecture_id = 0
        @donation_address.valid?
        expect(@donation_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'municipalityが空だと購入できない' do
        @donation_address.municipality = nil
        @donation_address.valid?
        expect(@donation_address.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'addressが空だと購入できない' do
        @donation_address.address = nil
        @donation_address.valid?
        expect(@donation_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'phoneが空だと購入できない' do
        @donation_address.phone = nil
        @donation_address.valid?
        expect(@donation_address.errors.full_messages).to include("Phone can't be blank")
      end
      it 'codeが3桁ハイフン4桁の半角文字列でないと購入できない' do
        @donation_address.code = 1234567
        @donation_address.valid?
        expect(@donation_address.errors.full_messages).to include("Code is invalid. Include hyphen(-)") 
      end
      it 'phoneが10桁以上の半角数値でないと購入できない' do
        @donation_address.phone = 123456789
        @donation_address.valid?   
        expect(@donation_address.errors.full_messages).to include("Phone is invalid")
      end 
      it 'phoneが11桁以上では購入できない' do
        @donation_address.phone = 123456789012
        @donation_address.valid?
        expect(@donation_address.errors.full_messages).to include("Phone is invalid")
      end  
      it 'userが空では登録できない' do
        @donation_address.user_id = nil
        @donation_address.valid?
        expect(@donation_address.errors.full_messages).to include("User can't be blank")
      end  
      it 'itemが空では登録できない' do
        @donation_address.item_id = nil
        @donation_address.valid?
        expect(@donation_address.errors.full_messages).to include("Item can't be blank")
      end  
      it 'tokenが空では登録できない' do
        @donation_address.token = nil
        @donation_address.valid?
        expect(@donation_address.errors.full_messages).to include("Token can't be blank")
      end  
      it 'phoneに全角文字を含むと登録できない' do
        @donation_address.phone = "あああ"
        @donation_address.valid?
        expect(@donation_address.errors.full_messages).to include("Phone is invalid")
      end  
    end
  end   
end