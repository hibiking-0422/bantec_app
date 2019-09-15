class CreateParts < ActiveRecord::Migration[6.0]
  def change
    create_table :parts do |t|
      t.string :part_name
      t.integer :unit_price
      t.integer :volume
      t.string :maker
      t.string :vender
      t.date :day

      t.timestamps
    end
  end
end
