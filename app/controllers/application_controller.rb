# frozen_string_literal: true

class ApplicationController < ActionController::Base
  rescue_from ActionController::ParameterMissing, with: :bad_parameters
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
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

  def bad_parameters(*)
    flash[:alert] = e.message
    redirect_to(root_path)
  end

  def record_not_found
    flash[:alert] = "Record not found"
    puts "--------Record not found-----"
    redirect_to(root_path)
  end

  def record_invalid(*)
    puts "----record_invalid-----"
    puts "Something went wrong: #{e.record.errors.full_messages.join(', ')}"
    flash[:alert] = "Something went wrong: #{e.record.errors.full_messages.join(', ')}"
    redirect_to(root_path)
  end
end
