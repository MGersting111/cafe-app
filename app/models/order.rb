class Order < ApplicationRecord
  has_many :line_items

  def grand_total
    @grand_total ||= line_items.sum(:anzahl)
  end
end
