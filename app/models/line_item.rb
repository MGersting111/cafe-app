# frozen_string_literal: true

class LineItem < ApplicationRecord
  belongs_to :article
  belongs_to :company


  def total
    count * article.price
  end
end
