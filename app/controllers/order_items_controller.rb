# frozen_string_literal: true

class OrderItemsController < ApplicationController
  def create
    @order = current_order
    @order_item = current_order_item
    @order.save
    session[:order_id] = @order.id
  end

  def update
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.update(order_item_params)
  end

  def destroy
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
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
    return query[0] if query.any?

    puts "creating a new order_item"
    @order_item = @order.order_items.new(order_item_params)
  end
end
