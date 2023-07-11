class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :authenticate_user!, only: [:new, :create, :edit]
  before_action :set_item, only: [:edit, :update, :show]

  def index
    @items = Item.includes(:user).order(created_at: :desc)
  end

  def move_to_index
    redirect_to new_user_session_path unless user_signed_in?
  end

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

    if @item.user != current_user
      redirect_to root_path, alert: "You do not have permission to edit this item."
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to root_path
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
    render :edit, status: :unprocessable_entity
    end
  end

  def show
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:image, :item_name,:description,:detail_category_id,:detail_condition_id,:delivery_format_id,:region_id,:arrival_id,:price).merge(user_id: current_user.id)
  end
end
