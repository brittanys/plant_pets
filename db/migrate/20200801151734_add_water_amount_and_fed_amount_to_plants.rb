class AddWaterAmountAndFedAmountToPlants < ActiveRecord::Migration[5.2]
  def change
    add_column :plants, :water_amount, :integer
    add_column :plants, :fed_amount, :integer
  end
end
