class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index]
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @item = Item.order("created_at DESC")
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to @item, notice: 'Item was successfully created.'
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name,:description,:detail_category_id,:detail_condition_id,:delivery_format_id,:region_id,:arrival_id,:price).merge(user_id: current_user.id)
  end
end
