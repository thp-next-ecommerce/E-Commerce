# frozen_string_literal: true

class BasketsController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @order_items = current_order.order_items
  end
end
