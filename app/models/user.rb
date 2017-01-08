class User < ApplicationRecord
  # relations
  has_one :profile

  # validation
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true

  # default
  before_create :new_user

  def new_user
    self.password = Digest::SHA512.hexdigest(self.password)
    self.status = 'pending'
  end
end
