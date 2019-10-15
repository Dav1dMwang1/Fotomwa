class Product < ApplicationRecord
  # belongs_to :category
  belongs_to :brand
  has_many :order_products, dependent: :nullify, inverse_of: :products
  has_many :orders, through: :order_products, inverse_of: :products
end
