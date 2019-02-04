class OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    puts "-------"
    puts @order.inspect
    puts "-------"
    @order_items = OrderItem.where(order_id: @order.id)
    puts @order_items.inspect
    puts "-------"
  end

  def index
    @user = current_user
    @orders = Order.where(user_id: @user.id)
  end
end
