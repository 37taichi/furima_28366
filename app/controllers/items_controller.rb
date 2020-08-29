class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :set_item, only: [:edit, :show]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def delete
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save!
      return redirect_to root_path
    else
      render "new"
    end
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :text, :category_id, :status_id, :price, :shipping_day_id, :shipping_origin_id, :delivery_fee_id, :user, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end  
end
