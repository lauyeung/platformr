class CreateExerciseSets < ActiveRecord::Migration
  def change
    create_table :exercise_sets do |t|
      t.integer :reps, null: false
      t.decimal :weight
      t.integer :superset_id, null: false
      t.integer :exercise_id, null: false

      t.timestamps
    end
  end
end
