class Report < ApplicationRecord
  has_many :report_items, dependent: :destroy
end
