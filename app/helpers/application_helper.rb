module ApplicationHelper
  def format_money(value, precision = 2)
    "#{(value / 100).round(precision)} €"
  end
end
