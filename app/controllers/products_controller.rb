class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]
   
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
  end 

  def edit
    if current_user.id == @product.user_id || @product.buy.present?
      redirect_to root_path
    end
  end


  def destroy
    if @product.destroy
       redirect_to root_path
    else
       render :show
    end
  end


  def update
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
    if current_user.id != @product.user_id
      redirect_to root_path
    end
  end

  def set_product
    @product = Product.find(params[:id])
  end

 

end