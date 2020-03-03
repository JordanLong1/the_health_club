class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.string :name 
      t.string :type 
      t.float :duration
      t.integer :calories_burned
      t.timestamps null: false
    end
  end
end
