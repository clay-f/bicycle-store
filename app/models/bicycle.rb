class Bicycle < ApplicationRecord
  belongs_to :category

  validates :name, :info, :price, presence: true
  validates :name, uniqueness: true
  validates :price, numericality: { greater_than_or_equal_to: 0.1 }
end
