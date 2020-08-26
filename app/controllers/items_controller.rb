class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
  end

  def new
  end


  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :text, :category, :status, :price_id, :shipping_days, :shipping_origin, :delivery_fee, :user, :image).merge(user_id: current_user.id)
  end
end
