# frozen_string_literal: true

class OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_items = OrderItem.where(order_id: @order.id)
  end

  def index
    @user = current_user
    @orders = Order.order_user.where(user_id: @user.id)
  end

  def close
    @order = Order.find(params[:id])
    puts @order.order_status_id
    @order.order_status_id = 2
    @order.save
    puts @order.order_status_id
    session[:order_id] = nil
  end
end
