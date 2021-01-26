class OrdersController < ApplicationController
  def index
    @product = Product.find(params[:product_id])
    @order = Order.new
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to root_path
    else
      render :index
    end
     
  end

  private
  def order_params
    params.require(:order).permit(:post_code, :shipping_place_id, :city, :address, :phone_number, :building_name, :buy_id, :product_id).merge(user_id: current_user.id, product_id: params[:product_id])
  end
end 