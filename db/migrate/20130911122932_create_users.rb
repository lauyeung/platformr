class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, null: false, unique: true
      t.string :email, null: false, unique: true
      t.string :first_name
      t.string :last_name
      t.string :user_photo
      t.string :account_privacy, null: false, default: "private"

      t.timestamps
    end
  end
end
