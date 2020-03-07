class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :workouts, :type, :muscle_group
  end
end
