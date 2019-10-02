class Product < ApplicationRecord
  belongs_to :category
  has_one :brand
  has_many :order_products
  has_many :orders, through: :order_products
end
