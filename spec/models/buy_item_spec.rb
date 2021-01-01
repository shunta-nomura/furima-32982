require 'rails_helper'

RSpec.describe BuyItem, type: :model do
  before do
    @user = FactoryBot.build(:user)
    @item = FactoryBot.build(:item)
    @buy_item = FactoryBot.build(:buy_item, user_id: @user, item_id: @item)
  end

  context '正常系' do
    it '全てのカラムが存在していれば保存ができる' do
      expect(@buy_item).to be_valid
    end

    it 'building_nameが空でも登録できる' do
      @buy_item.building_name = nil
      expect(@buy_item).to be_valid
    end
  end

  context '異常系' do
    it 'post_numberがなければ登録できない' do
      @buy_item.post_number = nil
      @buy_item.valid?
      expect(@buy_item.errors.full_messages).to include("郵便番号を入力してください")
    end

    it 'post_numberは3文字-4文字の数字以外の登録できない' do
      @buy_item.post_number = '1234567'
      @buy_item.valid?
      expect(@buy_item.errors.full_messages).to include("郵便番号は不正な値です")
    end

    it 'prefecture_idが0であれば登録できない' do
      @buy_item.prefecture_id = 0
      @buy_item.valid?
      expect(@buy_item.errors.full_messages).to include("都道府県は0以外の値にしてください")
    end
    it 'prefecture_idが空であれば登録できない' do
      @buy_item.prefecture_id = nil
      @buy_item.valid?
      expect(@buy_item.errors.full_messages).to include("都道府県を入力してください")
    end

    it 'city_nameが空であれば登録できない' do
      @buy_item.city_name = nil
      @buy_item.valid?
      expect(@buy_item.errors.full_messages).to include("市区町村を入力してください")
    end

    it 'addressが空であれば登録できない' do
      @buy_item.address = nil
      @buy_item.valid?
      expect(@buy_item.errors.full_messages).to include("番地を入力してください")
    end

    it 'call_numberが空であれば登録できない' do
      @buy_item.call_number = nil
      @buy_item.valid?
      expect(@buy_item.errors.full_messages).to include("電話番号を入力してください")
    end

    it 'call_numberが数字のみでなければ登録できない' do
      @buy_item.call_number = "1234567890a"
      @buy_item.valid?
      expect(@buy_item.errors.full_messages).to include("電話番号は数値で入力してください")
    end

    it 'call_numberが12文字以上であれば登録できない' do
      @buy_item.call_number = 123456789012
      @buy_item.valid?
      expect(@buy_item.errors.full_messages).to include("電話番号は11文字以内で入力してください")
    end

    it 'tokenが空であれば登録できない' do
      @buy_item.token = nil
      @buy_item.valid?
      expect(@buy_item.errors.full_messages).to include("カード情報を入力してください")
    end

    it 'user_idが空であれば登録できない' do
      @buy_item.user_id = nil
      @buy_item.valid?
      expect(@buy_item.errors.full_messages).to include("Userを入力してください")
    end

    it 'item_idが空であれば登録できない' do
      @buy_item.item_id = nil
      @buy_item.valid?
      expect(@buy_item.errors.full_messages).to include("Itemを入力してください")
    end
  end
end
