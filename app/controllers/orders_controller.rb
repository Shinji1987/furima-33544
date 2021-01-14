class OrdersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @order_delivery_address = OrderDeliveryAddress.new
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def create
    @item = Item.find(params[:item_id])
    @order_delivery_address = OrderDeliveryAddress.new(order_params)
    if @order_delivery_address.valid?
      @order_delivery_address.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def order_params
    params.require(:order_delivery_address).permit(:postal_code, :prefecture_id, :city_town, :street_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end