class User < ApplicationRecord
  authenticates_with_sorcery!

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :nickname, presence: true, length: { maximum: 255 }
  validates :email, presence: true, uniqueness: true
  has_many :desks, dependent: :destroy

  def own?(object)
    id == object&.user_id
  end
end
