class WorkInterval < ActiveRecord::Base
  attr_accessible :end_date, :start_date

  belongs_to :task
end
