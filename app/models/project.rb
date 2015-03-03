class Project < ActiveRecord::Base
  has_many :funding_levels, dependent: :nullify

  validates :name, presence: true, length: { minimum: 3 }
  validates :description, presence: true
end