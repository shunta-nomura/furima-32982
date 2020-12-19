class ItemsController < ApplicationController
  def index
  end

  def new
    
  end

  def create
    
  end

  private

  def item_params
    params.require(:item).permit(:name,:description,:category_id,:status_id,:shipping_burden_id,:shipping_area_id,:shipping_day_id,:price, :image).merge(user_id: current_user.id)
  end
end
