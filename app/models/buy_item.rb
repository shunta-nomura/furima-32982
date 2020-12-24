class BuyItem 
  include ActiveModel::Model
  attr_accessor :post_number,:prefecture_id,:city_name,:address,:building_name,:call_number,:user_id,:item_id

  with_options presence: true do
    validates :post_number, format: { with: /\A\d{3}[-]\d{4}\z/}
    validates :prefecture_id ,numericality: { other_than: 0 }
    validates :city_name
    validates :address
    validates :call_number
    validates :item_id
    validates :user_id
  end

  def save
    buy = Buy.create(user_id: user_id, item_id: item_id)
    ConsumerPlace.create(post_number: post_number,prefecture_id: prefecture_id, city_name: city_name, address: address, building_name: building_name, call_number:call_number, buy_id: buy.id)
  end
end