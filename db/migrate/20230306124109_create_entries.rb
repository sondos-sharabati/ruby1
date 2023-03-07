class CreateEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :entries do |t|
      t.string :meal_type
      t.string :calories
      t.integer :protiens
      t.integer :carboh
      t.integer :fats

      t.timestamps
    end
  end
end
