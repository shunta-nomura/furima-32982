class BuysController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @buy_item = BuyItem.new
  end
  def create
    binding.pry
  end

  private

end
