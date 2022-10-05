class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :meal_time

      t.timestamps
    end
  end
end
