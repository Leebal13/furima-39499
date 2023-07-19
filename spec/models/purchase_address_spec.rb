require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, item_id: item.id)
  end

  describe '商品購入情報の保存' do
    context '内容に問題ない場合' do
      it 'すべての値が正しく入力され、tokenがあれば保存できる' do
        expect(@purchase_address).to be_valid
      end

      it 'building_noが空でも保存できる' do
        @purchase_address.building_no = ''
        expect(@purchase_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できない' do
        @purchase_address.postal_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できない' do
        @purchase_address.postal_code = '1234567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Postal code は「3桁ハイフン4桁」の半角文字列で入力してください')
      end

      it 'region_idを選択していないと保存できない' do
        @purchase_address.region_id = 0
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Region を選択してください')
      end

      it 'cityが空だと保存できない' do
        @purchase_address.city = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City can't be blank")
      end

      it 'address_numberが空だと保存できない' do
        @purchase_address.address_no = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Address no can't be blank")
      end

      it 'phone_numberが空だと保存できない' do
        @purchase_address.phone_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberに全角文字が入っていると保存できない' do
        @purchase_address.phone_number = '0000000１１0'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number は10桁以上11桁以内の半角数値で入力してください")
      end
      it 'phone_numberが半角数字10桁未満だと保存できない' do
        @purchase_address.phone_number = '090127234'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number は10桁以上11桁以内の半角数値で入力してください")
      end
      it 'phone_numberが半角数字12桁以上だと保存できない' do
        @purchase_address.phone_number = '090127234571'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number は10桁以上11桁以内の半角数値で入力してください")
      end

      it 'userが紐付いていないと保存できない' do
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("User can't be blank")
      end

      it 'itemが紐付いていないと保存できない' do
        @purchase_address.item_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
      end

      it 'tokenが空では保存できない' do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
