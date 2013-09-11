# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    username "MyString"
    email "MyString"
    first_name "MyString"
    last_name "MyString"
    user_photo "MyString"
    account_privacy "MyString"
    profile_privacy "MyString"
    comment_privacy "MyString"
    workout_privacy "MyString"
    weight_used_privacy "MyString"
  end
end
