require 'spec_helper'

feature 'user views an exercise', %Q{
  As an authenticated user
  I want to view one of my exercises
  So that I can see details about that exercise
} do

  # ACCEPTANCE CRITERIA
  # * User sees the exercises they have created

  let(:user) { FactoryGirl.create(:user) }
  let(:exercise) { FactoryGirl.create(:exercise, user_id: user.id) }

  scenario 'user views an exercise' do
    sign_in_as(user)
    create_a_workout(exercise)
    visit exercise_path(exercise)
    expect(page).to have_content(exercise.name)
  end

  include PlatformrTestHelpers

end
