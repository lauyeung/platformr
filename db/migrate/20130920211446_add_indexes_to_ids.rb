class AddIndexesToIds < ActiveRecord::Migration
  def change
    add_index :comments, :workout_id
    add_index :exercise_sets, :superset_id
    add_index :exercise_sets, :exercise_id
    add_index :supersets, :workout_id
    add_index :workouts, :user_id
  end
end

