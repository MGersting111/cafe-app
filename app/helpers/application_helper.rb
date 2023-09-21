# frozen_string_literal: true

module ApplicationHelper
  def format_money(cent)
    value = cent / 100.0
    formatted = format('%.2f', value)
    "#{formatted} €"
  end
end
