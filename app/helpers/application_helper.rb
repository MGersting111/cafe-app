# frozen_string_literal: true

module ApplicationHelper
  def format_money(value, precision = 2)
    "#{'%.2f' % (value / 100.0).round(precision)} €"
  end
end
