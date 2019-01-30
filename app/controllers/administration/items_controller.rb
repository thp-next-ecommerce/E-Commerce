# frozen_string_literal: true

module Administration
  class ItemsController < AdministrationController
    def index
      @items = Items.all
    end

    def show
      @item = Item.find(params[:id])
    end

    def delete; end

    def create; end
  end
end
