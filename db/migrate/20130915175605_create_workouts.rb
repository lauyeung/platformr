class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.date :workout_date, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
