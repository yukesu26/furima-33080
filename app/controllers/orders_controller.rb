class OrdersController < ApplicationController
  def index
  end

  def new
    @order = Order.new   
  end

  def create
    @order = Order.new(order_params)   
    if @user_donation.valid?
      @user_donation.save
      redirect_to action: :index
    else
      render action: :new
    end
  end
end
