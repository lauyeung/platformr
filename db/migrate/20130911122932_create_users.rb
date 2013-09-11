class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :email, null: false
      t.string :first_name
      t.string :last_name
      t.string :user_photo
      t.string :account_privacy, null: false
      t.string :profile_privacy, null: false
      t.string :comment_privacy, null: false
      t.string :workout_privacy, null: false
      t.string :weight_used_privacy, null: false

      t.timestamps
    end
  end
end
