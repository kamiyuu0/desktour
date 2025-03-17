class Desk < ApplicationRecord
  validates :title, presence: true, length: { maximum: 255 }
  validates :content, length: { maximum: 65_535 }
  mount_uploader :desk_image, DeskImageUploader
  belongs_to :user

  def neo_url
    self.desk_image.url.gsub('upload/', 'upload/w_600/')
  end
end
