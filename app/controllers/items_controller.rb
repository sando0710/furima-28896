class ItemsController < ApplicationController

  before_action :move_to_index, except: [:index, :show]
  before_action :set_items, only: [:show, :edit, :update]

  def index
    @items = Item.includes(:user).order('created_at ASC')
    
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show

  end

  def edit
    
  end

  def update
    if @item.user_id == current_user.id
      if @item.update(item_params)
        redirect_to item_path(@item.id)
      else
        render :edit
      end
    else
      redirect_to action: :edit
    end
  end 



  private

  def move_to_index
    redirect_to new_user_session_path unless user_signed_in?
  end

  def set_items
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :introduction, :category_id, :condition_id, :delivery_burden_id, :prefecture_id, :prepare_day_id, :price, :image).merge(user_id: current_user.id)
  end
end
