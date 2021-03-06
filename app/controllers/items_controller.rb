# frozen_string_literal: true

class ItemsController < ApplicationController
  def index
    @items = Item.active.page(params[:page])
    @order_items = current_order.order_items.new
  end

  def show
    @item = Item.find(params[:id])
    @order_item = current_order.order_items.find_by(item_id: @item.id) || current_order.order_items.new
  end
end
