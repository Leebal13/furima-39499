class PurchasesController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
  end

  def new
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      @purchase_address.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def purchase_params
    params.require(:purchase_address).permit(:postal_code, :region, :prefecture, :address_no, :building_no, :phone_number).merge(user_id: current_user.id, item_id] current_item.id)
  end

  # def address_params
  #   params.permit(:postal_code,:region_id, :prefecture, :address_no, :building_no).merge(purchase_id: @purchase.id)
  # end
end
