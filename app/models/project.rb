class Project < ActiveRecord::Base
  attr_accessible :description, :name, :planned_duration, :start

  validates :name, :presence => true

  belongs_to :user
  has_many :tasks, :dependent => :destroy

  def time_spent
    seconds = self.tasks.sum(&:time_spent)
  end
end
