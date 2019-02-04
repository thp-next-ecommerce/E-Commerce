class OrdersController < ApplicationController
  def show
  end

  def index
    @user = current_user
    @orders = Order.where(user_id: @user.id)
  end
end
