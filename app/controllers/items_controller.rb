class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
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
    params.require(:item).permit(:name, :text, :category_id, :status_id, :price, :shipping_days_id, :shipping_origin_id, :delivery_fee_id, :user, :image).merge(user_id: current_user.id)
  end
end
