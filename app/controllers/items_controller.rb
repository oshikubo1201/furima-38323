class ItemsController < ApplicationController

  before_action :set_item, only: [:edit, :show, :update]
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_protect, only: [:edit, :destory]
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
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else render :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])
      @item.destroy
      redirect_to root_path
    end

  end



  private

  def item_params
    params.require(:item).permit(:items_name,:explanation,:category_id,:situation_id,:delivery_charge_id,:prefecture_id,:days_to_ship_id,:price,:image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_protect
    unless user_signed_in? && @item.user.id == current_user.id &&  @item.purchase_record == nil
      redirect_to action: :index
    end
  end


