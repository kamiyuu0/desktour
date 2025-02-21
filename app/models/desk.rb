class Desk < ApplicationRecord
  validates :title, presence: true, length: { maximum: 255 }
  validates :content, length: { maximum: 65_535 }
  mount_uploader :desk_image, DeskImageUploader
  belongs_to :user
end
