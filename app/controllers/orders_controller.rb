class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_protect, only: :index
  before_action :set_item, only: [:index, :create]
  def index
    # Formオブジェクトのインスタンスを作成して、インスタンス変数に代入する
    @order = Order.new
  end
  
  def create
    @order = Order.new(purchase_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end
  
  private

  def purchase_params
    params.require(:order).permit(:post_code, :prefecture_id, :municipalitie, :address, :building, :telephone,).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: purchase_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def set_protect
    @item = Item.find(params[:item_id])
    unless  @item.purchase_record == nil && @item.user.id != current_user.id 
      redirect_to root_path
    end
  end

  def set_item
    @item = Item.find(params[:item_id])
  end


  

end
