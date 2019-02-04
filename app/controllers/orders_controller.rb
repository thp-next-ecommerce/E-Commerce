# frozen_string_literal: true

class OrdersController < ApplicationController
  def index; end

  def show; end

  def close
    @order = current_order
  end
end
