# frozen_string_literal: true

module Shop
  class BaseController < ::ApplicationController
    include EnsureCurrentCompany

    before_action :setup_current_order
    before_action :discard_current_order
    before_action :clear_table
    before_action :bind_table

    private

    def setup_current_order
      session[:order_id] ||= SecureRandom.uuid
      @current_order = Order.find_or_create_by!(
        company:  current_company,
        order_id: session[:order_id]
      )
    end

    def spawn_new_current_order
      session[:order_id] = nil
      setup_current_order
    end

    def clear_table
      return unless params[:clear_table] == 't'

      @current_order.update(table: nil)
    end

    def discard_current_order
      return unless params[:clear_order_id] == 't'

      if @current_order
        @current_order.line_items.destroy_all
      end
    end

    def bind_table
      order_table_id = params[:bind_table]
      return if order_table_id.nil?

      table = Table.find_by(id: order_table_id)
      return if table.nil?

      @current_order.update(table: table)
    end
  end
end
