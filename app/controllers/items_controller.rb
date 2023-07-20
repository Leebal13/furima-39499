class ItemsController < ApplicationController
  # before_action :move_to_index, except: [:index, :show]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :update, :show]

  def index
    @items = Item.includes(:user).order(created_at: :desc)
  end

  # def move_to_index
  #   redirect_to new_item_purchase_path unless user_signed_in?
  # end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path, notice: 'Item was successfully created.'
    else
      @items = Item.includes(:user)
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @item = Item.find(params[:id])
    if @item.user == current_user.id
      redirect_to action: :index
    elsif Purchase.where(item_id: @item.id).exists?
      redirect_to action: :index
    end
  end

  def destroy
    @item = Item.find_by(id: params[:id])

  if @item.nil?
    flash[:error] = "Item not found."
    redirect_to root_path
  elsif @item.user != current_user
    flash[:error] = "You are not authorized to delete this item."
    redirect_to root_path
  else
    @item.destroy
    flash[:success] = "Item deleted successfully."
    redirect_to root_path
  end
    # if @item.user == current_user
    #   @item.destroy
    #   redirect_to root_path
    # else
    #   redirect_to root_path, alert: "You do not have permission to delete this item."
    # end  
  end

  def update
    if @item.update(item_params)
      redirect_to action: :show
    else
    render :edit, status: :unprocessable_entity
    end
  end

  def show
    session[:current_item_id] = @item.id
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:image, :item_name,:description,:detail_category_id,:detail_condition_id,:delivery_format_id,:region_id,:arrival_id,:price).merge(user_id: current_user.id)
  end
end
