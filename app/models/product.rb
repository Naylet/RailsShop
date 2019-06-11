class Product < ApplicationRecord
  has_many :line_items
  belongs_to :category

  mount_uploader :image, ImageUploader
  serialize :preferences

  validates :name, :price, presence: true
  validates :description , length: {maximum: 1000, too_long: "%{count} characters is the maximum aloud."}
  validates :price, numericality: true, length: {maximum: 10}


end
