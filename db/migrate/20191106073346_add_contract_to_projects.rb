class AddContractToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :contract, :int
  end
end
