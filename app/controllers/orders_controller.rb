# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @user = current_user
    @orders = Order.order_user.where(user_id: @user.id)
  end

  def show
    @order = Order.find(params[:id])
    @order_items = OrderItem.where(order_id: @order.id)
  end

  def close
    @order = Order.find(params[:id])
    @order.order_status_id = 2
    @order.save
    session[:order_id] = nil
  end
end
