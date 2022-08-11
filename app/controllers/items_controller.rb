class ItemsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :edit]
  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    unless user_signed_in? && @item.user.id == current_user.id
      redirect_to action: :index
    end

  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path
    else render :edit
    end

  end

  private

  def item_params
    params.require(:item).permit(:items_name,:explanation,:category_id,:situation_id,:delivery_charge_id,:prefecture_id,:days_to_ship_id,:price,:image).merge(user_id: current_user.id)
  end
end
