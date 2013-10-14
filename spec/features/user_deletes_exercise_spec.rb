require 'spec_helper'

feature 'user deletes exercises', %Q{
  As an authenticated user
  I want to be able to delete exercises
  So that I can remove exercises that I do not need in my tracker or were erroneously added
} do

  # ACCEPTANCE CRITERIA
  # * I can delete one or more exercises from a summary location
  # * I can delete an individual workout from the page
  # * I will get a notification asking me if I'm sure and confirming my choice in case I hit the wrong button

  let(:user) { FactoryGirl.create(:user) }
  let(:exercise) { FactoryGirl.create(:exercise, user_id: user.id) }

  scenario 'user deletes an exercise' do
    sign_in_as(user)
    exercise
    prev_count = Exercise.count
    visit exercises_path
    click_link 'Delete'
    expect(page).to have_content('Exercise was successfully deleted!')
    expect(Exercise.count).to eql(prev_count - 1)
  end

  scenario 'user cannot delete an exercise in use by a workout' do
    sign_in_as(user)
    exercise
    create_a_workout(exercise)
    visit exercises_path
    expect(page).to have_content(exercise.name)
    expect(page).to_not have_link('Delete')
  end

  include PlatformrTestHelpers

end
