class Category < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :products
  has_ancestry
  acts_as_list

  validates :name, presence: true

  def update_categories(parent_category, position)
    if parent_category.present?
      self.update(parent_id: parent_category.id, position: position)
    else
      self.update(parent_id: nil, position: position)
    end
  end
end
