# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:username) {|n| "user#{n}" }
    sequence(:email) {|n| "user#{n}@email.com" }
    password "foofoobar"
    password_confirmation { |u| u.password }

    factory :user_with_workout do
      after(:create) do |user|
        FactoryGirl.create(:workout, user: user)
      end
    end

 end

  factory :workout do
    workout_date Time.now
    user

    factory :workout_with_blank_combination do
      after(:create) do |workout|
        FactoryGirl.create(:combination, workout: workout, sets: '')
      end
    end
  end

  factory :combination do
    sets 5
    sets_complete 0
    association :workout, :with_exercise_sets
  end

  factory :superset do
    weight 50
    workout_with_blank_combination
  end

  factory :exercise_set do
    reps 3
    superset
    exercise
  end

  factory :exercise do
    sequence(:name) {|n| "Exercise #{n}" }
    user
  end
end
