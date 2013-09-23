class AddUserIdToExercises < ActiveRecord::Migration
  def change
    add_column :exercises, :user_id, :integer, null: false
    add_index :exercises, :user_id
  end
end

