require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  context '正常系' do
    it 'itemの全てのカラムが存在していれば保存ができる' do
      expect(@item).to be_valid
    end
  end

  context '異常系' do
    it '商品画像を1枚つけないと登録できないこと' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it '商品名が無いと登録できないこと' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it '商品の説明が無いと登録できないこと' do
      @item.description = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end

    it 'カテゴリー情報が無いと登録できないこと' do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it 'カテゴリー情報のactive_hashが1ならば登録できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Category must be other than 1')
    end

    it '商品の状態が無いと登録できないこと' do
      @item.status_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank")
    end

    it '商品状態のactive_hashが1ならば登録できない' do
      @item.status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Status must be other than 1')
    end

    it '配送料の負担が無いと登録できないこと' do
      @item.shipping_burden_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping burden can't be blank")
    end

    it '配送料の負担のactive_hashが1ならば登録できない' do
      @item.shipping_burden_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping burden must be other than 1')
    end

    it '配送先の地域が無いと登録できないこと' do
      @item.shipping_area_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping area can't be blank")
    end

    it '配送先地域のactive_hashが1ならば登録できない' do
      @item.shipping_area_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping area must be other than 1')
    end

    it '発送までの日時が無いと登録できないこと' do
      @item.shipping_day_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping day can't be blank")
    end

    it '発送までの日時のactive_hashが1ならば登録できない' do
      @item.shipping_day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping day must be other than 1')
    end

    it '価格の情報が無いと登録できないこと' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it '価格の範囲が、300円以下なら登録できないこと' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
    end

    it '価格の範囲が、9999999以上なら登録できないこと' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
    end

    it '価格は半角数字でないと登録できないこと' do
      @item.price = '２２２'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end
  end
end
