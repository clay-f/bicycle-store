class Product < ApplicationRecord
  attr_accessor :avatar_cache
  mount_uploader :avatar, AvatarUploader

  has_many :line_items
  belongs_to :category
  before_destroy :ensure_not_referenced_by_any_line_item

  private

  def ensure_not_referenced_by_any_line_item
    unless line_items.empty?
      errors.add(:base, 'Line Items present')
      throw :abort
    end
  end
end
