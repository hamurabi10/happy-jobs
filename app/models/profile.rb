class Profile < ApplicationRecord
  # relations
  belongs_to :company
  belongs_to :user

  # image
  mount_uploader :avatar, AvatarUploader

  # validation
  validates :names, presence: true
  validates :email, presence: true, uniqueness: true

  # default
  before_create :new_profile

  def new_profile
    self.admin = false
  end
end
