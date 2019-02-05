# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :current_order
  before_action :set_locale

  def current_order
    return Order.find(session[:order_id]) if session[:order_id]

    new_order = Order.new
    new_order.user = current_user
    new_order
  end

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
end
