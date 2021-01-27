class OrdersController < ApplicationController
 

  def index
    @product = Product.find(params[:product_id])
    @order = Order.new
  end

  def new
    @order = Order.new
  end

  def create
       @product = Product.find(params[:product_id])
       @order = Order.new(order_params)
    if @order.valid? 
      pay_item
      @order.save
      redirect_to root_path
    else
      @product = Product.find(params[:product_id])
      render :index
    end
     
  end

  private
  def order_params
    params.require(:order).permit(:post_code, :shipping_place_id, :city, :address, :phone_number, :building_name, :buy_id, :product_id).merge(user_id: current_user.id, product_id: params[:product_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]    # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @product.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
  
end 