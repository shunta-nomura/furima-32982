class CreateConsumerPlaces < ActiveRecord::Migration[6.0]
  def change
    create_table :consumer_places do |t|
      t.string        :post_number,        null:false
      t.integer       :prefecture_id,        null:false
      t.string        :city_name,        null:false
      t.string        :address,        null:false
      t.string        :building_name
      t.bigint    :call_number,        null:false
      t.references     :buy,         foreign_key: true, null:false
      t.timestamps
    end
  end
end
