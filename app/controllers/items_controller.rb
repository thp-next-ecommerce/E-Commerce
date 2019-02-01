# frozen_string_literal: true

class ItemsController < ApplicationController
  def index
    @items = Item.active.paginate(:page => params[:page], :per_page => 15)
    @order_items = current_order.order_items.new
  end

  def show
    @item = Item.find(params[:id])
  end
end
