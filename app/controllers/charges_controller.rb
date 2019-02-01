# frozen_string_literal: true

class ChargesController < ApplicationController
  before_action :authenticate_user!
  
  def new; end

  def create
    @item = Item.find(params[:id])
    # Amount in cents
    @amount = @item.price * 100

    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      source: params[:stripeToken]
    )

    Stripe::Charge.create(
      customer: customer.id,
      amount: @amount,
      description: 'Magic payment',
      currency: 'eur'
    )
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end
end
