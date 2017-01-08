class Department < ApplicationRecord
  # relations
  belongs_to :company

  # validations
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true

  # default
  before_create :new_department

  def new_department
    self.status = 'pending'
    self.color ||= '#337AB7'
  end
end
