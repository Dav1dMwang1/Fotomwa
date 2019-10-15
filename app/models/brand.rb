class Brand < ApplicationRecord
  has_many :products, dependent: :nullify, inverse_of: :brand
  belongs_to :category
end
