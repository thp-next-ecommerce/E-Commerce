# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :current_order

  def current_order
    Order.find(session[:order_id]) unless session[:order_id].nil?
    Order.new
  end

  protected

  def after_sign_in_path_for(_admins)
    administration_admin_path
  end
end
