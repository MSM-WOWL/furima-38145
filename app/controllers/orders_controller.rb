class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index

  def index
    @product = Product.find(params[:product_id])
    @order = Order.new
    if current_user.id == @product.user.id || @product.purchase.present?
      redirect_to root_path
    end
  end

  def create
    @product = Product.find(params[:product_id])
    @order = Order.new(purchase_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  def purchase_params
    params.require(:order).permit(:postal_code, :send_area_id, :municipalities, :address, :building, :phone_number).merge(user_id: current_user.id, product_id: params[:product_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @product.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end
end
