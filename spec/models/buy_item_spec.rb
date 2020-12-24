require 'rails_helper'

RSpec.describe BuyItem, type: :model do
    before do
      @buy_item = FactoryBot.build(:buy_item)
    end

    context '正常系' do
      it '全てのカラムが存在していれば保存ができる' do
       # expect(@buy_item).to be_valid
      end
    end
end
