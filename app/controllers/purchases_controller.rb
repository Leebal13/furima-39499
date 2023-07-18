class PurchasesController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new
  end

  def new
    @purchase_address = PurchaseAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      @purchase_address.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  # def update
  #   purchase = PurchaseAddress.find(params[:id])
  #   purchase.update(purchase_params)
  #   redirect_to root_path
  # end

  private

  def purchase_params
    item_id = session[:current_item_id]
    params.require(:purchase_address).permit(:postal_code, :region_id, :prefecture, :address_no, :building_no, :phone_number).merge(user_id: current_user.id, item_id: item_id)
  end

  # def address_params
  #   params.permit(:postal_code,:region_id, :prefecture, :address_no, :building_no).merge(purchase_id: @purchase.id)
  # end
end
