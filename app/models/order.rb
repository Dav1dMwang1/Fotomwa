class Order < ApplicationRecord
  belongs_to :user
  has_many :order_products, dependent: :nullify
  has_many :products, through: :order_products, dependent: :nullify

  mount_uploaders :images, ImageUploader
end
