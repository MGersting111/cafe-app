class LineItem < ApplicationRecord
  belongs_to :article

  def total
    anzahl * article.price
  end
end
