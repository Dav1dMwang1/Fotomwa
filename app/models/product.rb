class Product < ApplicationRecord
  belongs_to :brand
  has_many :order_products, dependent: :nullify, inverse_of: :products
  has_many :orders, through: :order_products, inverse_of: :products

  validates :processing_time, numericality: { only_integer: true }
end
