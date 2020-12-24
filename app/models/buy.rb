class Buy < ApplicationRecord
belongs_to :user
belongs_to :item
has_one :consumer_place 　

  with_options presence: true do
    validates :user
    validates :item
  end
end
