class Desk < ApplicationRecord
  validates :title, presence: true, length: { maximum: 255 }
  validates :content, length: { maximum: 65_535 }
  belongs_to :user
end
