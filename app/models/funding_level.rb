class FundingLevel < ActiveRecord::Base
  has_many :pledges, dependent: :nullify
  belongs_to :project

  validates :project_id, :reward_name, :amount, presence: true
  validates :reward_name, length: { minimum: 3 }
  validates :amount, numericality: { only_integer: true, :greater_than => 0 } 
end