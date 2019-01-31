# frozen_string_literal: true

class ItemsController < ApplicationController
  def index
    @items = Item.active
    @order_items = current_order.order_items.new
  end

  def show
    @item = Item.find(params[:id])
  end
end
