class CreateSubcons < ActiveRecord::Migration[6.0]
  def change
    create_table :subcons do |t|
      t.string :subcon_name
      t.integer :subcon_cost
      t.date :day
      t.integer :project_id

      t.timestamps
    end
  end
end
