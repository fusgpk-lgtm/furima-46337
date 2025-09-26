class PurchaseRecordsController < ApplicationController
  before_action :authenticate_user!, except: :index
  def index
    @item = Item.find(params[:item_id])
    @purchase_form = PurchaseForm.new
  end

  def create
    @item = Item.find_by(id: params[:item_id])
    @purchase_form = PurchaseForm.new(purchase_form_params)
    if @purchase_form.valid?
      @purchase_form.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def purchase_form_params
    params.require(:purchase_form).permit(:post_number, :prefecture_id, :city, :house_number, :house_name, :phone_number).merge(
      user_id: current_user.id, item_id: @item.id
    )
  end
end
