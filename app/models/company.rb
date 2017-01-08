class Company < ApplicationRecord
  # relations
  has_many :departments
  has_many :profiles

  # image
  mount_uploader :logo, LogoUploader

  # validations
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :email, presence:true, uniqueness: true

  # default data
  before_create :new_company

  def new_company
    self.status = 'pending'
  end
end
