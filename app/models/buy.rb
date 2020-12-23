class Buy < ApplicationRecord
belongs_to :user
belongs_to :item
has_one :consumer_place 　
end
