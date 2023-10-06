# frozen_string_literal: true

class User < ApplicationRecord
  belongs_to :company
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :confirmable
  # :lockable,
  # :timeoutable,
  # :trackable,
  # :omniauthable,
end
