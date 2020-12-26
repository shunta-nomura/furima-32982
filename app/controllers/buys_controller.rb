class BuysController < ApplicationController
  before_action :item_find, only: [:index, :create]
  before_action :authenticate_user!, only: [:index, :create]
  def index
    @buy_item = BuyItem.new
    redirect_to root_path if current_user.id == @item.user_id || !@item.buy.nil?
  end

  def create
    @buy_item = BuyItem.new(buy_item_params)
    if @buy_item.valid?
      pay_item
      @buy_item.save
      redirect_to root_path
    else
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
            :call_number
          ).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price, # 商品の値段
      card: params[:token],    # カードトークン
      currency: 'jpy'
    )
  end

  def item_find
    @item = Item.find(params[:item_id])
  end
end
