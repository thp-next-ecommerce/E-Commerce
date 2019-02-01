# frozen_string_literal: true

class BasketsController < ApplicationController
  def show
    @order = current_order
  end
end
