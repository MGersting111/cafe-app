# frozen_string_literal: true

class ApplicationController < ActionController::Base
  add_flash_types :error, :notice, :success

  before_action :set_company
  before_action :set_locale
  before_action :discard_current_order
  before_action :setup_current_order
  before_action :clear_table
  before_action :bind_table

  private

  def set_company
    if !session[:company]
      session[:company] = 1
      redirect_to companies_url
    end
  end

  def set_locale
    session[:locale] ||= I18n.default_locale.to_s

    requested_locale = params[:l]&.to_s

    if requested_locale
      session[:locale] = requested_locale
    end

    resolved_locale = session[:locale]

    if !I18n.available_locales.include?(resolved_locale.to_sym)
      resolved_locale = I18n.default_locale.to_s
    end

    I18n.locale = resolved_locale.to_sym
  end

  def discard_current_order
    return unless params[:clear_order_id] == 't'

    session[:order_id] = nil
  end

  def setup_current_order
    session[:order_id] ||= SecureRandom.uuid
    @current_order = Order.find_or_create_by(order_id: session[:order_id])
  end

  def spawn_new_current_order
    session[:order_id] = nil
    setup_current_order
  end

  def clear_table
    return unless params[:clear_table] == 't'

    @current_order.update(table: nil)
  end

  def bind_table
    order_table_id = params[:bind_table]
    return if order_table_id.nil?

    table = Table.find_by(id: order_table_id)
    return if table.nil?

    @current_order.update(table: table)
  end

  def after_sign_in_path_for(_resource)
    administration_dashboard_path
  end
end
