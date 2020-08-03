class CreatePlants < ActiveRecord::Migration[5.2]
  def change
    create_table :plants do |t|
      t.string :name
      t.datetime :watered_at
      t.datetime :fed_at
      t.integer :growth

      t.timestamps
    end
  end
end
