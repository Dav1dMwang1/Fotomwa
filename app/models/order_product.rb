class OrderProduct < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates_presence_of :order
  validates_presence_of :product
end
