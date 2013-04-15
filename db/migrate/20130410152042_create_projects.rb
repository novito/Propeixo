class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.integer :user_id
      t.string :name
      t.text :description
      t.integer :planned_duration
      t.datetime :start

      t.timestamps
    end
  end
end
