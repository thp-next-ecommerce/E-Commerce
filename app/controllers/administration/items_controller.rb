# frozen_string_literal: true

module Administration
  class ItemsController < AdministrationController
    def index
      @items = Item.sorted_by_name
    end

    def show
      @item = Item.find(params[:id])
    end

    def new
      @item = Item.new
    end

    def edit
      @item = Item.find(params[:id])
    end

    def destroy
      item = Item.find(params[:id])
      delete_item(item)
    end

    def create
      @item = Item.new(item_params)
      item_valid?(@item)
      redirect_to administration_items_path
    end

    def update
      item = Item.find(params[:id])
      update_item(item)
      item_valid?(item)
      redirect_to administration_items_path
    end

    private

    def item_params
      params.require(:item).permit(:name, :discounted_percentage, :original_price, :active, :description )
    end

    def item_valid?(item)
      if item.valid?
        item.save
        flash[:notice] = "Product updated successfuly"
      else
        flash[:alert] = item.errors.full_messages
      end
    end

    def update_item(item)
      if params[:item][:discount_percentage] != 0
        item.update(item_params)
        item.has_discount = true
      else
        item.update(item_params)
        item.has_discount = false
      end
    end

    def delete_item(item)
      if item.destroy
        flash[:notice] = "Product has been deleted successfuly"
        redirect_to administration_items_path
      else
        flash[:alert] = item.erros.full_messages
        redirect_to administration_items_path
      end
    end
  end
end
