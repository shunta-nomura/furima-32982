class BuysController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @buy_item = BuyItem.new
  end

  def create
    @buy_item = BuyItem.new(buy_item_params)
    if @buy_item.valid?
      @buy_item.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private
  def buy_item_params
    params.require(:buy_item)
    .permit(
      :post_number, 
      :prefecture_id, 
      :city_name, 
      :address, 
      :building_name, 
      :call_number,
    ).merge(user_id: current_user.id, item_id: params[:item_id] )
  end
end
