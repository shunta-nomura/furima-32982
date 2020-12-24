class BuyItem
  include ActiveModel::Model
  attr_accessor :post_number,:prefecture_id,:city_name,:address,:building_name,:call_number,:buy,:user,:item

  with_options presence: true do
    validates :post_number
    validates :prefecture_id
    validates :city_name
    validates :address
    validates :call_number
    validates :buy
  end
end