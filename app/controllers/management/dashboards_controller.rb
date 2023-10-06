# frozen_string_literal: true

module Management
  class DashboardsController < BaseController
    def show
      @amountOrders = Order.where(:state => "running").count
      @amountOrdersServed = Order.where(:state => "served").count
      @amountOrdersPayed = Order.where(:state => "payed").count
    end
  end
end
