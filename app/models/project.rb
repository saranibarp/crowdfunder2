class Project < ActiveRecord::Base
  has_many :funding_levels, dependent: :nullify
  has_many :pledges, :through => :funding_levels 

  validates :name, presence: true, length: { minimum: 3 }
  validates :description, presence: true

  def all_funding_levels
    self.funding_levels.order(amount: :asc)
  end

  def all_pledges
    self.pledges.order(created_at: :desc)
  end
end