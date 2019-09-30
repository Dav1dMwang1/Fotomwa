class Product < ApplicationRecord
  belongs_to :category
  has_one :brand
  has_many :orders
end
