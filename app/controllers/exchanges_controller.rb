class ExchangesController < ApplicationController
  before_action :set_item, only: [:index, :create]
  skip_before_action :verify_authenticity_token
  def index
    @exchange = ExchangeS.new
  end
  def create
    @exchange = ExchangeS.new(exchanges_params)
    if @exchange.valid?
      pay
      @exchange.save
      redirect_to root_path
    else
      render 'index'
    end
  end
  private
  
  def pay
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: exchanges_params[:token],
      currency: 'jpy'
    )
  end
  def set_item
    @item = Item.find(params[:item_id])
  end


  def exchanges_params
    params.require(:exchange_s).permit(:city, :post_code, :prefecture, :phone_number, :address, :building,:token).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
