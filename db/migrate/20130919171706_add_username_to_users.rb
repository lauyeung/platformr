class AddUsernameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string, null: false, default: ""
    add_index :users, :username, unique: true
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :account_privacy, :string, default: "private"
  end
end
