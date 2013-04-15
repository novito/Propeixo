class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :project_id
      t.string :name
      t.text :description
      t.integer :planned_duration

      t.timestamps
    end
  end
end
