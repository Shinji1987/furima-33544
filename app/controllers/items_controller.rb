class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :set_protection, only: [:edit, :update, :destroy]

  def index
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

  def show
  end

  def edit
    if Order.exists?(item_id: @item.id)
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :status_id, :delivery_pay_method_id,
                                 :sender_region_id, :delivery_duration_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_protection
    redirect_to action: :index unless @item.user_id == current_user.id
  end
end