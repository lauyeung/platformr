require 'spec_helper'

feature 'user edits workouts', %Q{
  As an authenticated user
  I want to add edit the workouts I have created
  So that I can make changes to workouts
} do

  # ACCEPTANCE CRITERIA
  # * I want to edit a workout

  let(:user) { FactoryGirl.create(:user) }
  let(:exercise) { FactoryGirl.create(:exercise, user_id: user.id) }

  scenario 'user edits a workout' do
    sign_in_as(user)
    create_a_workout(exercise)
    prev_count = Workout.count
    visit workouts_path
    click_link 'Edit'
    fill_in 'Sets', with: '6', :match => :prefer_exact
    click_button 'Update Workout'
    expect(page).to have_content('Workout was successfully updated!')
    expect(Workout.count).to eql(prev_count)
  end

  include PlatformrTestHelpers

end
