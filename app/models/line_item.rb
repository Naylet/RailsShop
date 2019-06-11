class LineItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates :unit_price, presence: true
end
