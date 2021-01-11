class ItemsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    # @items = Item.all
    # @items = Item.order('created_at DESC')
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render('items/new')
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :status_id, :delivery_pay_method_id,
                                 :sender_region_id, :delivery_duration_id, :price).merge(user_id: current_user.id)
  end
end
