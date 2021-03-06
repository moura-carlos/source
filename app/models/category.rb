class Category < ApplicationRecord
  has_many :category_items, dependent: :destroy
  has_many :items, through: :category_items

  validates :title, presence: true
  validates :title, uniqueness: true
end
