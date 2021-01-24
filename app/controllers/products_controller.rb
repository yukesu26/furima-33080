class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :move_to_index, except: [:show, :index, :edit]
  
  def index
    @products = Product.all.order(created_at: :desc)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params) 
     if @product.save
      redirect_to root_path 
    else
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
  end 

  def edit
    @product = Product.find(params[:id])
    if current_user.id != @product.user_id
      redirect_to root_path
    end
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to product_path(@product)
    else 
      render :edit
    end   
  end 

  private
  def product_params
    params.require(:product).permit(:name, :memo, :image, :category_id, :item_state_id, :delivery_fee_id, :shipping_place_id, :send_day_id, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in? 
      redirect_to action: :index
    end
  end


end