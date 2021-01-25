class OrdersController < ApplicationController
  def index
    @product = Product.find(params[:product_id])
  end

  def new
  end

  def create
    @order = Order.new(order_params)   
    
     
  end

  private
  def order_params
    params.permit(:post_code, :shipping_place_id, :city, :address, :phone_number, :building_name, product_id).merge(user_id: current_user.id)
  end
end 