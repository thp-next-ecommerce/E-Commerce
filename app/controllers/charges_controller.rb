# frozen_string_literal: true

class ChargesController < ApplicationController
  def new; end

  def create
    @order = Order.find(params[:id])
    # Amount in cents
    @amount = @order.subtotal * 100

    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      source: params[:stripeToken]
    )

    Stripe::Charge.create(
      customer: customer.id,
      amount: @amount.to_i,
      description: 'Magic payment',
      currency: 'eur'
    )
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end
end
