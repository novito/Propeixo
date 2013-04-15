class CreateWorkIntervals < ActiveRecord::Migration
  def change
    create_table :work_intervals do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.integer :task_id

      t.timestamps
    end
  end
end
