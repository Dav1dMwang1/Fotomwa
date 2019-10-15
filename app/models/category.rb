class Category < ApplicationRecord
  has_many :brands, dependent: :nullify, inverse_of: :category
  # has_many :products, dependent: :nullify, inverse_of: :category
end
