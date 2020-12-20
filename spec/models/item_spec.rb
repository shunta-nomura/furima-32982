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
end
