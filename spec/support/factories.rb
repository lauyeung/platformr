# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :exercise do
    sequence(:name) {|n| "Exercise #{n}" }
  end
end
