class CreateCombinations < ActiveRecord::Migration
  def up
    create_table :combinations do |t|
      t.integer :sets, null: false
      t.integer :sets_complete, null: false, default: 0
      t.integer :workout_id, null: false

      t.timestamps
    end

    add_index :combinations, :workout_id

    remove_column :supersets, :sets
    remove_column :supersets, :sets_complete
    remove_column :supersets, :workout_id
    add_column :supersets, :weight, :decimal
    add_column :supersets, :combination_id, :integer, null: false

    add_index :supersets, :combination_id

    remove_column :exercise_sets, :weight
  end

  def down
    drop_table :combinations

    remove_index :supersets, :combination_id

    remove_column :supersets, :weight
    remove_column :supersets, :combination_id

    add_column :supersets, :sets, :integer, null: false
    add_column :supersets, :sets_complete, :integer, null: false, default: 0
    add_column :supersets, :workout_id, :integer, null: false

    add_index :supersets, :workout_id

    add_column :exercise_sets, :weight, :decimal
  end
end
