class AddWageToWork < ActiveRecord::Migration[6.0]
  def change
    add_column :works, :wage, :integer
  end
end
