# frozen_string_literal: true

module ApplicationHelper
  FLASH_MAPPING = {
    alert:   { class: :danger,  icon: 'exclamation-triangle-fill' },
    success: { class: :success, icon: 'check-circle-fill' },
    notice:  { class: :light,   icon: 'info-circle-fill' }
  }

  def format_money(cent)
    value = cent / 100.0
    formatted = format('%.2f', value)
    "#{formatted} €"
  end
end
