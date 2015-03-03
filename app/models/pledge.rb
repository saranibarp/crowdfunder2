class Pledge < ActiveRecord::Base
  belongs_to :funding_level

  validates :funding_level_id, :name, :email, :amount, presence: true
  validates :amount, numericality: { :greater_than => 0 }
end