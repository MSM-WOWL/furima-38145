class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_product, only: [:show, :edit, :update]

  def index
    @products = Product.order("created_at DESC")
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
    unless user_signed_in? && @product.user.id == current_user.id
      redirect_to action: :index
    end
  end

  def update
    if @product.update(product_params)
      redirect_to product_path
    else
      render :edit
    end
  end

  private

  def product_params
    params.require(:product).permit(:item, :price, :explain, :category_id, :condition_id, :postage_id, :send_area_id, :send_day_id, :image).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end
  
end
