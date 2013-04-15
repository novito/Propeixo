class Task < ActiveRecord::Base
  attr_accessible :description, :name, :planned_duration

  validates :name, :presence => true

  belongs_to :project
  has_many :work_intervals, :dependent => :destroy

  # Checks if the current task has any active work interval
  def has_wip?
    return true if self.work_intervals.where(:end_date => nil).any?
    return false
  end

  # Return time spend in task (in seconds)
  def time_spent
    seconds = self.work_intervals
    .map {|i| (i.end_date || Time.now).to_time - i.start_date.to_time }
    .reduce(:+)
  end

  def active_work_interval 
    self.work_intervals.where(end_date: nil).last
  end

end
