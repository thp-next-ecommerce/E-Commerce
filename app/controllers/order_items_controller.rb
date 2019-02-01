# frozen_string_literal: true

class OrderItemsController < ApplicationController
  def create
    @order = current_order
    puts 'order.new ========================================'
    puts @order.inspect
    @order_item = current_order_item
    puts 'params ========================================'
    puts order_item_params
    puts 'order_item.new ========================================'
    puts @order_item.inspect
    @order.save
    puts 'order.save ========================================'
    puts @order.inspect
    puts @order.errors.inspect
    session[:order_id] = @order.id
    puts session
  end

  def update
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.update(order_item_params)

    @order_items = @order.order_items
  end

  def destroy
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy

    @order_items = @order.order_items
  end

  private

  def order_item_params
    params.require(:order_item).permit(:quantity, :item_id)
  end

  def current_order_item
    query = OrderItem.where(
      item_id: order_item_params[:item_id],
      order_id: current_order.id
    )
    puts "found orderItem reference"
    return query[0] if query.any?

    puts "creating a new order_item"
    @order_item = @order.order_items.new(order_item_params)
  end
end
