class Order < ApplicationRecord
  belongs_to :user
  has_many :order_products, dependent: :nullify
  has_many :products, through: :order_products, dependent: :nullify
  accepts_nested_attributes_for :order_products, reject_if: lambda { |a| a[:content].blank? }, allow_destroy: true

  mount_uploaders :images, ImageUploader
  validates_processing_of :images
  validate :image_size_validation

  private

  def image_size_validation
    errors[:images] << "should be less than 5 MB" if images.size > 5.megabytes
  end
end
