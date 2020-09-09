class ItemsController < ApplicationController
  before_action :correct_user, only: [:edit, :update]
  before_action :set_active_hash ,only: [:new, :create, :edit, :update]
  def index
    @item = Item.all()
    @exchange = Exchange.all()
    
  end

  def new
    @item = Item.new()
    @user = User.find(current_user.id)
  end

  def create
    @item = Item.new(items_params)
  
    if @item.save
      redirect_to root_path
    else
    flash[:alert] = '正しく入力されていない箇所があります。'
    render :new
    end
  end
  
  def edit
     @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
 
      if @item.user_id == current_user.id
        @item.update(update_params)
        redirect_to_root_path
  
      else
      flash[:alert] = '正しく入力されていない箇所があります。'
      render :edit
      end
  end

  def show
    @item = Item.find(params[:id])   #itemの該当idのレコードを取ってくる
    @exchange = Exchange.all()
    @user = User.find(@item.user_id)
    @category = Category.find(@item.category_id)
    @condition = Condition.find(@item.condition_id)
    @prefecture = Prefecture.find(@item.prefecture_id)
    @prepare_day = PrepareDay.find(@item.prepare_day_id)
    @delivery_burden = DeliveryBurden.find(@item.delivery_burden_id)
  end

  def back
    render :new
  end

  def destroy
    @item = Item.find(params[:id])
     if @item.user_id == current_user.id
      @item.destroy #destroyメソッドを使用し対象のitemを削除する。
      redirect_to_root_path
     end
  end

      private
      def items_params   
        params.require(:item).permit(:user_id, :name, :price, :text, :item_image,:introduction,:category_id,:prefecture_id,:prepare_day_id,:delivery_burden_id,:condition_id )
      end
      def update_params
        params.require(:item).permit(:user_id, :name, :price, :text, :item_image,:introduction,:category_id,:prefecture_id,:prepare_day_id,:delivery_burden_id,:condition_id )
      end
      def correct_user
        @item = Item.find(params[:id])
        if user_signed_in?
          redirect_to("/") unless @item.user_id == current_user.id
        else redirect_to_root_path
        end
      end
      def set_active_hash
        @categorys = Category.all()
        @conditions = Condition.all()
        @delivery_burden = DeliveryBurden.all()
        @prepare_days = PrepareDay.all
        @prefectures = Prefecture.all()
        
      end
      
end
