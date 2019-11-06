class Brand < ApplicationRecord
  has_many :products, dependent: :nullify, inverse_of: :brand
  belongs_to :category

  validates :processing_time, numericality: { only_integer: true }
end
