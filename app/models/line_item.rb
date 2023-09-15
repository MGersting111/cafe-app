class LineItem < ApplicationRecord
  belongs_to :article

  def total
    count * article.price
  end
end
