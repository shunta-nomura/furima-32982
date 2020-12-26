class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :item_find, only: [:show, :edit, :update, :destroy]
  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    redirect_to root_path unless @item.buy.nil?
    render :show if @item.user_id != current_user.id
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    render :show if @item.user_id != current_user.id
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :status_id, :shipping_burden_id, :shipping_area_id,
                                 :shipping_day_id, :price, :image).merge(user_id: current_user.id)
  end

  def item_find
    @item = Item.find(params[:id])
  end
end
