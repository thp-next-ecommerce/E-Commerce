class OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_items = OrderItem.where(order_id: @order.id)
  end

  def index
    @user = current_user
    @orders = Order.where(user_id: @user.id)
  end
end
