require 'spec_helper'


feature 'user adds exercises', %Q{
  As an authenticated user
  I want to update exercises
  So that I change what exercises I have available to me
} do

# ACCEPTANCE CRITERIA
# * I must specify the name of the exercise
# * I must specify a unique exercise

  let(:user) { FactoryGirl.create(:user) }

  scenario 'specifies valid information' do
    sign_in_as(user)
    prev_count = Exercise.count
    visit new_exercise_path
    fill_in 'Name', with: 'Clean'
    click_button 'Create Exercise'
    expect(page).to have_content("Exercise was successfully added!")
    expect(Exercise.count).to eql(prev_count + 1)
  end

  # scenario 'no information entered' do
  #   prev_count = Exercise.count
  #   visit '/exercises'
  #   click_link 'Add New Exercise'
  #   click_button 'Submit'
  #   expect(page).to have_content("can't be blank")
  #   expect(Exercise.count).to eql(prev_count)
  # end

  # scenario 'try to enter the same exercise again' do
  #   Exercise.create(name: "Clean")
  #   prev_count = Exercise.count
  #   visit '/exercises'
  #   click_link 'Add New Exercise'
  #   fill_in 'Name', with: 'Clean'
  #   click_button 'Submit'
  #   expect(page).to have_content("already exists")
  #   expect(Exercise.count).to eql(prev_count)
  # end

  def sign_in_as(user)
    visit new_user_session_path
    fill_in 'Username or email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'
  end

end
