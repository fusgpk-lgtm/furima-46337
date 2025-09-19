class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
    redirect_to '/'
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :image, :explanation, :category_id, :state_id, :delivery_charge_id, :ship_from_id,
                                 :ship_day_id, :price).merge(user_id: current_user.id)
  end
end
