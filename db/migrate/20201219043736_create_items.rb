class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.name                :string   , null:false
      t.description         :text     , null:false
      t.category_id         :integer  , null:false
      t.status_id           :integer  , null:false
      t.shipping_burden_id  :integer  , null:false
      t.shipping_area_id    :integer  , null:false
      t.shipping_day_id     :integer  , null:false
      t.price               :integer  , null:false
      t.user                :reference, null:false, foreign_key: true
      t.timestamps
    end
  end
end
