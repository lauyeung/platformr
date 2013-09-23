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
    prev_count = Exercise.count
    visit '/exercises'
    click_link 'Add New Exercise'
    fill_in 'Name', with: 'Clean'
    click_button 'Submit'
    expect(page).to have_content("Exercise was successfully added!")
    expect(Exercise.count).to eql(prev_count + 1)
  end

  scenario 'no information entered' do
    prev_count = Exercise.count
    visit '/exercises'
    click_link 'Add New Exercise'
    click_button 'Submit'
    expect(page).to have_content("can't be blank")
    expect(Exercise.count).to eql(prev_count)
  end

  scenario 'try to enter the same exercise again' do
    Exercise.create(name: "Clean")
    prev_count = Exercise.count
    visit '/exercises'
    click_link 'Add New Exercise'
    fill_in 'Name', with: 'Clean'
    click_button 'Submit'
    expect(page).to have_content("already exists")
    expect(Exercise.count).to eql(prev_count)
  end

end
