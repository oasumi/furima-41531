class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!, only: :index

  def index
    @order_shipping_address = OrderShippingAddress.new
  end


  def create
    @order_shipping_address = OrderShippingAddress.new(order_params)
    
      @order_shipping_address.save
      redirect_to root_path
    
  end


  private
  def order_params
    params.require(:order_shipping_address).permit(:postal_code, :shipping_origin_id, :city, :street_address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end
