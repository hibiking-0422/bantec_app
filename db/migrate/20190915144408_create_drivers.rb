class CreateDrivers < ActiveRecord::Migration[6.0]
  def change
    create_table :drivers do |t|
      t.integer :driver_cost
      t.integer :project_id

      t.timestamps
    end
  end
end
