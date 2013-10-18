require 'spec_helper'


feature 'user adds exercises', %Q{
  As an authenticated user
  I want to add exercises
  So that I change what exercises I have available to me
} do

  # ACCEPTANCE CRITERIA
  # * I must specify the name of the exercise
  # * I must specify a unique exercise
  # * I can see a list of all my exercises

  let(:user) { FactoryGirl.create(:user) }

  scenario 'specifies valid information' do
    sign_in_as(user)
    prev_count = Exercise.count
    visit exercises_path
    fill_in 'Exercise name', with: 'Clean'
    click_button 'Create Exercise'
    expect(page).to have_content("Exercise was successfully added!")
    expect(Exercise.count).to eql(prev_count + 1)
  end

  scenario 'no information entered' do
    sign_in_as(user)
    prev_count = Exercise.count
    visit exercises_path
    click_button 'Create Exercise'
    expect(page).to have_content("can't be blank")
    expect(Exercise.count).to eql(prev_count)
  end

  scenario 'try to enter the same exercise again' do
    exercise = 'Clean'
    sign_in_as(user)
    FactoryGirl.create(:exercise, name: exercise)
    prev_count = Exercise.count
    visit exercises_path
    fill_in 'Exercise name', with: exercise
    click_button 'Create Exercise'
    expect(page).to have_content("already exists")
    expect(Exercise.count).to eql(prev_count)
  end

  scenario 'user sees a list of all exercises' do
    exercise = 'Clean'
    sign_in_as(user)
    visit exercises_path
    fill_in 'Exercise name', with: exercise
    click_button 'Create Exercise'
    visit exercises_path
    expect(page).to have_content(exercise)
  end

  include PlatformrTestHelpers

end
