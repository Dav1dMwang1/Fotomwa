class Category < ApplicationRecord
  has_many :brands, dependent: :nullify, inverse_of: :category

  validates :processing_time, numericality: { only_integer: true }
end
