class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @order_shipping_address =OrderShippingAddress.new
  end


  def create
    @order_shipping_address =OrderShippingAddress.new(order_params)
    if @order_shipping_address.valid?
      @order_shipping_address.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end


  private
  def order_params
    params.require(:order_shipping_address).permit(:postal_code, :shipping_origin_id, :city, :street_address, :building_name, :phone_number).merge(order_id: order.id)
  end
end
