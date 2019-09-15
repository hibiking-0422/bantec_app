class AddDayToDrivers < ActiveRecord::Migration[6.0]
  def change
    add_column :drivers, :day, :date
  end
end
