class AddProjectIdToPart < ActiveRecord::Migration[6.0]
  def change
    add_column :parts, :project_id, :integer
  end
end
