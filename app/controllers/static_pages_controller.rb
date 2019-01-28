# frozen_string_literal: true

class StaticPagesController < ApplicationController
  def home
    @items = Item.all
  end

  def contact; end

  def about; end
end
