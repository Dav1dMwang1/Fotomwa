class Brand < ApplicationRecord
  has_many :products, dependent: :nullify, inverse_of: :brand
end
