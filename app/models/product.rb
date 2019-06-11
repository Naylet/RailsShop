class Product < ApplicationRecord
  has_many :line_items
  belongs_to :category

  mount_uploader :image, ImageUploader

  validates :name, :price, presence: true
  validates :description , length: {maximum: 1000, too_long: "%{count} characters is the maximum aloud."}
  validates :price, numericality: {only_integer: true}, length: {maximum: 10}


end
