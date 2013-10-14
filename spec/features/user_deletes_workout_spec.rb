require 'spec_helper'

feature 'user deletes workouts', %Q{
  As an authenticated user
  I want to be able to delete workouts
  So that I can remove workouts that I do not need in my tracker or were erroneously added
  } do

  # ACCEPTANCE CRITERIA
  # * I can delete one or more workouts from a summary location
  # * I can delete an individual workout from the page
  # * I will get a notification asking me if I'm sure and confirming my choice in case I hit the wrong button

  let(:user) { FactoryGirl.create(:user) }
  let(:exercise) { FactoryGirl.create(:exercise, user_id: user.id) }

  scenario 'user deletes a workout' do
    sign_in_as(user)
    create_a_workout(exercise)
    prev_count = Workout.count
    visit workouts_path
    click_link 'Delete'
    expect(page).to have_content('Workout was successfully deleted!')
    expect(Workout.count).to eql(prev_count - 1)
  end

  include PlatformrTestHelpers

end
