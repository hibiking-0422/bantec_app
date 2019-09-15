class AddDayToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :day, :date
  end
end
