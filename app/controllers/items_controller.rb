class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
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
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    if @item.user_id != current_user.id?
      render :show
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end
  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :status_id, :shipping_burden_id, :shipping_area_id,
                                 :shipping_day_id, :price, :image).merge(user_id: current_user.id)
  end
end
