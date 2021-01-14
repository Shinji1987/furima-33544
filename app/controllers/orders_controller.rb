class OrdersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @orders = Order.all
    @order = Order.new
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def pay
    @item = Item.find(params[:item_id])
end