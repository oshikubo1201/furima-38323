class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :create
  def index
    # Formオブジェクトのインスタンスを作成して、インスタンス変数に代入する
    @item = Item.find(params[:item_id])
    @order = Order.new
  end
  
  def create
    @item = Item.find(params[:item_id])
    @order = Order.new(purchase_params)
    if @order.valid?
      @order.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end
  
  private

  def purchase_params
    params.require(:order).permit(:post_code, :prefecture_id, :municipalitie, :address, :building, :telephone,).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  # def purchase_record_params
  #   params.merge(user_id: current_user.id, item_id:@item.id)
  # end

  # def shipping_address_params
  #   params.permit(:post_code, :prefecture_id, :municipalitie, :address, :building, :telephone).merge(purchase_record_id: @purchase_record.id)
  # end

end
