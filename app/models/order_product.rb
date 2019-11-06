class OrderProduct < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates_presence_of :order
  validates_presence_of :product

  validates :processing_time, numericality: { only_integer: true }
  validates :amount, numericality: { only_integer: true }
end
