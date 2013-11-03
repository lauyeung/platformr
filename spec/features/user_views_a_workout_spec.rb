require 'spec_helper'

feature 'user views a workout', %Q{
  As an authenticated user
  I want to view a workout
  So that I can see the details of that workout
} do

  # ACCEPTANCE CRITERIA
  # * User sees the workouts they have created

  let(:user) { FactoryGirl.create(:user) }
  let(:exercise_1) { FactoryGirl.create(:exercise, user_id: user.id) }
  let(:exercise_2) { FactoryGirl.create(:exercise, user_id: user.id) }

  scenario 'user views a workout' do
    sign_in_as(user)
    create_a_workout(exercise_1)
    visit workout_path(Workout.last)
    expect(page).to have_content(Workout.last.workout_date)
  end

  include PlatformrTestHelpers

end
