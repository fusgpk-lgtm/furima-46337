class PurchaseRecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  before_action :redirect_if_invalid_purchase, only: [:index, :create]

  def index
    @purchase_form = PurchaseForm.new
  end

  def create
    @purchase_form = PurchaseForm.new(purchase_form_params)
    if @purchase_form.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def purchase_form_params
    params.require(:purchase_form).permit(:post_number, :prefecture_id, :city, :house_number, :house_name, :phone_number, :token).merge(
      user_id: current_user.id, item_id: @item.id
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def redirect_if_invalid_purchase
    # 出品者自身が購入しようとした場合、または商品がすでに売却済みの場合はトップページにリダイレクト
    return unless current_user.id == @item.user_id || @item.purchase_record.present?

    redirect_to root_path
  end
end
