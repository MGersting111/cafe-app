# frozen_string_literal: true

class ApplicationController < ActionController::Base
  add_flash_types :error, :notice, :success

  before_action :set_locale

  include SetCurrentCompany

  private

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

  def after_sign_in_path_for(_resource)
    administration_dashboard_path
  end
end
