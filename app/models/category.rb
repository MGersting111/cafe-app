# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :article
  has_one_attached :image
  belongs_to :company

end
