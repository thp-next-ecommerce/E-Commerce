# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :current_order

  def current_order
    Order.find(session[:order_id]) if session[:order_id]

    Order.new
  end
end
