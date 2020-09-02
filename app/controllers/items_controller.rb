class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :set_item, only: [:edit, :show, :update]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def show
  end

  def edit
  end

  def destroy
    item = Item.find(params[:id])
    if item.destroy
      redirect_to root_path
    else
      render :edit
    end
  end

  def update
    item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save!
      redirect_to root_path
    else
      render 'new'
    end
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  private


  def item_params
    params.require(:item).permit(:name, :text, :category_id, :status_id, :price, :shipping_day_id, :shipping_origin_id, :delivery_fee_id, :user, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
