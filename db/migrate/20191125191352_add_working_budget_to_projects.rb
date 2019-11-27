class AddWorkingBudgetToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :working_budget, :int
  end
end
