class CreateWorks < ActiveRecord::Migration[6.0]
  def change
    create_table :works do |t|
      t.string :worker
      t.integer :working_hour
      t.date :day
      t.integer :project_id

      t.timestamps
    end
  end
end
