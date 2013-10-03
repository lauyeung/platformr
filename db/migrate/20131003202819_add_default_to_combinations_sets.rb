class AddDefaultToCombinationsSets < ActiveRecord::Migration
  def up
    change_column :combinations, :sets, :integer, default: 0
  end

  def down
    change_column :combinations, :sets, :integer, default: nil
  end
end
