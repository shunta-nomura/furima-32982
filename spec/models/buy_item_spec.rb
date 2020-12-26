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
      expect(@buy_item.errors.full_messages).to include("Post number can't be blank")
    end

    it 'post_numberは3文字-4文字の数字以外の登録できない' do
      @buy_item.post_number = '1234567'
      @buy_item.valid?
      expect(@buy_item.errors.full_messages).to include('Post number is invalid')
    end

    it 'prefecture_idが0であれば登録できない' do
      @buy_item.prefecture_id = 0
      @buy_item.valid?
      expect(@buy_item.errors.full_messages).to include('Prefecture must be other than 0')
    end
    it 'prefecture_idが空であれば登録できない' do
      @buy_item.prefecture_id = nil
      @buy_item.valid?
      expect(@buy_item.errors.full_messages).to include("Prefecture can't be blank")
    end

    it 'city_nameが空であれば登録できない' do
      @buy_item.city_name = nil
      @buy_item.valid?
      expect(@buy_item.errors.full_messages).to include("City name can't be blank")
    end

    it 'addressが空であれば登録できない' do
      @buy_item.address = nil
      @buy_item.valid?
      expect(@buy_item.errors.full_messages).to include("Address can't be blank")
    end

    it 'call_numberが空であれば登録できない' do
      @buy_item.call_number = nil
      @buy_item.valid?
      expect(@buy_item.errors.full_messages).to include("Call number can't be blank")
    end

    it 'call_numberが数字のみでなければ登録できない' do
      @buy_item.call_number = "1234567890a"
      @buy_item.valid?
      expect(@buy_item.errors.full_messages).to include("Call number is not a number")
    end

    it 'call_numberが12文字以上であれば登録できない' do
      @buy_item.call_number = 123456789012
      @buy_item.valid?
      expect(@buy_item.errors.full_messages).to include("Call number is too long (maximum is 11 characters)")
    end

    it 'tokenが空であれば登録できない' do
      @buy_item.token = nil
      @buy_item.valid?
      expect(@buy_item.errors.full_messages).to include("Token can't be blank")
    end

    it 'user_idが空であれば登録できない' do
      @buy_item.user_id = nil
      @buy_item.valid?
      expect(@buy_item.errors.full_messages).to include("User can't be blank")
    end

    it 'item_idが空であれば登録できない' do
      @buy_item.item_id = nil
      @buy_item.valid?
      expect(@buy_item.errors.full_messages).to include("Item can't be blank")
    end
  end
end
