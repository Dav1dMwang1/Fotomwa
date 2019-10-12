class Category < ApplicationRecord
  has_many :products, dependent: :nullify, inverse_of: :category
end
