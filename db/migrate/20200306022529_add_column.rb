class AddColumn < ActiveRecord::Migration
  def change
    add_column :workouts, :user_id, :integer
  end
end
