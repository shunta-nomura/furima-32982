class BuysController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @buy_item = BuyItem.new
    unless user_signed_in?
      redirect_to root_path
    else
      if current_user.id == @item.user_id
        redirect_to root_path
      end
    end
  end

  def create
    @item = Item.find(params[:item_id])
    @buy_item = BuyItem.new(buy_item_params)
    if @buy_item.valid?
      pay_item
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
    ).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token] )
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: params[:token],    # カードトークン
      currency: 'jpy' 
    )
  end
end
