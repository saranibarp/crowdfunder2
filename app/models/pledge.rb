class Pledge < ActiveRecord::Base
  belongs_to :funding_level
  belongs_to :project

  validates :funding_level_id, :name, :email, :amount, presence: true
  validates :amount, numericality: { :greater_than => 0 }

  def fetch_funding_level(project)
    project.funding_levels.each do |level|
      if level.amount <= self.amount
        self.funding_level_id = level.id
      end
    end
  end

  def reward_name
    funding_level.reward_name
  end
end