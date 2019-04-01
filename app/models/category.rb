class Category < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :products
  has_ancestry

  validates :name, presence: true
end
