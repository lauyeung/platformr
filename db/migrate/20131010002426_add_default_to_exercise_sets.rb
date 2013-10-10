class AddDefaultToExerciseSets < ActiveRecord::Migration
  def up
    change_column :exercise_sets, :reps, :integer, default: 0
  end

  def down
    change_column :exercise_sets, :reps, :integer, default: nil
  end
end
