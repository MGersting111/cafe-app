class Order < ApplicationRecord
  has_many :line_items

  def grand_total
    self.line_items.map{ |i|
      i.anzahl
    }.sum
  end
end
