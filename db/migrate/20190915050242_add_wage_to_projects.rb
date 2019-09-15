class AddWageToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :wage, :integer
  end
end
