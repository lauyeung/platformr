class CreateSupersets < ActiveRecord::Migration
  def change
    create_table :supersets do |t|
      t.integer :sets, null: false
      t.integer :sets_complete, null: false, default: 0
      t.integer :workout_id, null: false

      t.timestamps
    end
  end
end
