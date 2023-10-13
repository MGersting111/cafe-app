# frozen_string_literal: true

module Administration
  class OrdersController < BaseController
    before_action :set_order, only: %i[show edit update destroy order_payed order_served]

    def index
      orders_scope = current_company.orders
      case params[:filter]
      when 'served'
        orders_scope = orders_scope.where(state: 'served')
      when 'paid'
        orders_scope = orders_scope.where(state: 'paid')
      else
        orders_scope = orders_scope.where(state: 'placed')
      end

      @orders = orders_scope
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
      @order.destroy!
      redirect_to administration_orders_url
    end

    def order_served
      @order.update!(state: 'served')
      redirect_to administration_orders_url
    end

    def order_payed
      @order.update!(state: 'paid')
      redirect_to administration_orders_url
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

