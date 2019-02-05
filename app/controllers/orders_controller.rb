# frozen_string_literal: true

class OrdersController < ApplicationController
  def index; end

  def show; end

  def close
    @order = Order.find(params[:id])
    puts @order.order_status_id
    @order.order_status_id = 2
    @order.save
    puts @order.order_status_id
    session[:order_id] = nil
  end
end
