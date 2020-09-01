class TransactionController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item, only: [:index, :create]
  before_action :not_selling_user?, only: [:index,:create]
  before_action :sell_out?, only: [:index,:create]

  def index
    @item_purchase = ItemPurchaseTransaction.new
  end

  def new
    @item_purchase = ItemPurchaseTransaction.new
  end

  def create
    @item_purchase = ItemPurchaseTransaction.new(item_purchase_params)
    if @item_purchase.valid?
      pay_item
      @item_purchase.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  def show
  end


  private
  
  def item_purchase_params
    params.permit(:price, :token,  :item_id, :postalcode,:shipping_origin_id, :prefecture, :city, :house_number, :building, :telephone).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def not_selling_user?
    if current_user == @item.user
      redirect_to root_path
    end
  end

  def sell_out? 
    if @item.item_purchase
    redirect_to root_path
    end
  end

end
