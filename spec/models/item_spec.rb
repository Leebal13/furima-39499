require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の情報を入力' do
    context '正しい情報が入力された場合' do
      it '必要な情報を適切に入力して「出品する」ボタンを押すと、商品の情報が更新されること' do
        expect(@item).to be_valid
      end

      it '商品名と説明、カテゴリーなどの情報が存在すれば更新できる' do
        expect(@item).to be_valid
      end
    end

    context '正しくない情報が入力された場合' do
      it '商品名が空では更新できないこと' do
        @item.item_name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end

      it '説明が空では更新できないこと' do
        @item.description = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'カテゴリーが空では更新できないこと' do
        @item.detail_category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Detail category can't be blank")
      end

      it '状態が空では更新できないこと' do
        @item.detail_condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Detail condition can't be blank")
      end

      it '配送方法が空では更新できないこと' do
        @item.delivery_format_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery format can't be blank")
      end

      it '地域が空では更新できないこと' do
        @item.region_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Region can't be blank")
      end

      it '到着までの日数が空では更新できないこと' do
        @item.arrival_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Arrival can't be blank")
      end

      it '価格が空では更新できないこと' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '価格が300未満の場合は更新できないこと' do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it '価格が9,999,999を超える場合は更新できないこと' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end

      it '画像が空では更新できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '価格に半角数字以外が含まれている場合は出品できないこと' do
        @item.price = "100abc"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it 'userが紐付いていなければ出品できないこと' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end

      it 'カテゴリーに「---」が選択されている場合は出品できないこと' do
        @item.detail_category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Detail category can't be blank")
      end

      it '商品の状態に「---」が選択されている場合は出品できないこと' do
        @item.detail_condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Detail condition can't be blank")
      end

      it '配送料の負担に「---」が選択されている場合は出品できないこと' do
        @item.delivery_format_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery format can't be blank")
      end

      it '発送元の地域に「---」が選択されている場合は出品できないこと' do
        @item.region_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Region can't be blank")
      end

      it '発送までの日数に「---」が選択されている場合は出品できないこと' do
        @item.arrival_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Arrival can't be blank")
      end

      # Add other invalid cases as needed
    end
  end
end
