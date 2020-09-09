class ExchangesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])

  end

  def create
    @exchange = Exchange.new(exchanges_params)
  
    if @exchange.save
      redirect_to root_path
    else
    flash[:alert] = '正しく入力されていない箇所があります。'
    render :new
    end
  end

  def exchanges_params   
    params.require(:exchange).permit(:exchanges_id,:city,:post_code,:prefecture_id,:phone_number,:address,:building )
  end




end
