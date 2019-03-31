class Product < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :category

  validates :name, :info, presence: true
  validates :image, file_size: { less_than: 5.megabytes }

  mount_uploader :image, ImageUploader
end
