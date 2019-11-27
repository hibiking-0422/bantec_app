class AddCostBudgetToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :cont_budget, :int
  end
end
