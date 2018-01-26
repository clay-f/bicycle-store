class Product < ApplicationRecord
  mount_uploaders :desc_images, AvatarUploader
  serialize :desc_images, JSON # If you use SQLite, add this line.

  has_many :line_items
  belongs_to :category
  before_destroy :ensure_not_referenced_by_any_line_item

  validates :avatar, allow_blank: true, format: {with: %r{\.(gif|jpg|png|jpeg)\Z}i, message: 'must be a URL for GIF, JPG or PNG image.'}

  private

  def ensure_not_referenced_by_any_line_item
    unless line_items.empty?
      errors.add(:base, 'Line Items present')
      throw :abort
    end
  end
end
