# frozen_string_literal: true

module Management
  class OrdersController < BaseController
    before_action :set_order, only: %i[show edit update destroy order_payed order_served]

    def index
      @orders = Order.all
    end

    def show; end

    def new
      @order = Order.new
    end

    def edit; end

    def create
      @order = Order.new(order_params)
      if @order.save
        redirect_to order_url(@order)
      else
        render :new
      end
    end

    def update
      table_id = order_params.delete(:table_id)
      table = Table.find_by(id: table_id)
      update_params = order_params.merge(table: table)

      if @order.update(update_params)
        redirect_to basket_path
      else
        render :edit
      end
    end

    def destroy
      @order.destroy
      redirect_to management_orders_url
    end

    def order_served
      @order.update(state: 'served')
      redirect_to management_orders_url
    end

    def orders_served
      @orders = Order.all
    end

    def order_payed
      @order.update(state: 'payed')
      redirect_to management_orders_url
    end

    def orders_payed
      @orders = Order.all
    end

    private

    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:table_id)
    end

  end
end

