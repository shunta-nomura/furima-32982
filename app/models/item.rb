class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_burden
  belongs_to :shipping_area
  belongs_to :shipping_day

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :shipping_burden_id
    validates :shipping_day_id
  end
  validates :shipping_area_id, numericality: { other_than: 0 }
  validates :price, numericality: { :greater_than_or_equal_to => 300, :less_than_or_equal_to => 9999999 }
end
