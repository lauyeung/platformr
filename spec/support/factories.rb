# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:username) {|n| "user#{n}" }
    sequence(:email) {|n| "user#{n}@email.com" }
    password "foofoobar"
    password_confirmation { |u| u.password }
  end
end


FactoryGirl.define do
  factory :exercise do
    sequence(:name) {|n| "Exercise #{n}" }
    association(:user)
  end
end
