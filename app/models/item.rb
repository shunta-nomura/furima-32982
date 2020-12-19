class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_burden
  belongs_to :shipping_area
  belongs_to :shipping_day

  validates :category_id, numericality: { other_than: 1 }
  validates :status_id, numericality: { other_than: 1 } 
  validates :shipping_burden_id, numericality: { other_than: 1 } 
  validates :shipping_area_id, numericality: { other_than: 1 } 
  validates :shipping_day_id, numericality: { other_than: 1 } 
end
