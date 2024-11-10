class Profile < ApplicationRecord
  belongs_to :user

  validates :username, length: { maximum: 12 }
  validates :bio, length: { maximum: 160 }
end
