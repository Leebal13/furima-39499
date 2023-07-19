class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item

  def index
    if Purchase.where(item_id: @item.id).exists?
      redirect_to root_path
    elsif @item.user_id == current_user.id
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      @purchase_address = PurchaseAddress.new
    end
  end

  # def new
    
  # end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  private

  def purchase_params
    item_id = session[:current_item_id]
    params.require(:purchase_address).permit(:postal_code, :region_id, :city, :address_no, :building_no, :phone_number, :item_id, :user_id, :token).merge(user_id: current_user.id, item_id: item_id,token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: purchase_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end
