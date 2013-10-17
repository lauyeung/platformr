require 'spec_helper'

feature 'user increments sets complete', %Q{
  As an authenticated user
  I want to have a counter for sets complete
  So that I can track how many sets I have complete
} do

  # ACCEPTANCE CRITERIA
  # * I must be able to increase the number of sets complete when viewing my workout

  let(:user) { FactoryGirl.create(:user) }
  let(:exercise) { FactoryGirl.create(:exercise, user_id: user.id) }

  scenario 'user edits a workout' do
    sign_in_as(user)
    create_a_workout(exercise)
    workout = Workout.last
    visit workout_path(workout)
    prev_sets_complete = workout.combinations.last.sets_complete
    click_button prev_sets_complete
    expect(workout.combinations.last.sets_complete).to eql(prev_sets_complete + 1)
  end

  scenario 'user edits a workout' do
    sign_in_as(user)
    create_a_workout(exercise)
    workout = Workout.last
    combination = workout.combinations.last
    combination.sets_complete = combination.sets
    combination.save
    visit workout_path(workout)
    click_button combination.sets_complete
    expect(combination.sets_complete).to eql(combination.sets)
  end


  include PlatformrTestHelpers

end
