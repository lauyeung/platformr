require 'spec_helper'

feature 'user adds exercises', %Q{
  As an authenticated user
  I want to add / edit / delete the exercises I have at my disposal
  So that I can customize my workouts to how I like them
} do

# ACCEPTANCE CRITERIA
# * I want to edit the names of exercises

  let(:user) { FactoryGirl.create(:user) }

  scenario 'update an existing exercise' do
    exercise = 'Deadlift'
    exercise2 = 'Deadlift, clean grip'
    sign_in_as(user)
    FactoryGirl.create(:exercise, name: exercise, user: user)
    prev_count = Exercise.count
    visit exercises_path
    find(:xpath, "//tr[td[contains(.,#{exercise})]]/td/a", :text => 'Edit').click
    fill_in 'Exercise name', with: exercise2
    click_button 'Update Exercise'
    expect(page).to have_content("Exercise was successfully updated!")
    expect(Exercise.count).to eql(prev_count)
  end



  def sign_in_as(user)
    visit '/'
    within(".dropdown") do
      fill_in 'Username or email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Sign in'
    end
  end

end
