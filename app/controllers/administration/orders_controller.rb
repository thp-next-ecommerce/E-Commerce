# frozen_string_literal: true

module Administration
  class OrdersController < AdministrationController
    def index
      @orders = Order.sorted_by_date
    end

    def show
      @order = Order.find(params[:id])
    end

    def update
      order = Order.find(params[:id])
      update_order(order)
    end

    def edit
      @order = Order.find(params[:id])
    end

    private

    def order_params
      params.require(:order).permit(:order_status_id)
    end

    def update_order(order)
      if order.valid?
        order.save
        flash[:notice] = "Commande mise à jour"
        redirect_to administration_orders_path
      else
        flash[:alert] = order.errors.full_messages
    end
  end
end
