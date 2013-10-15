require 'spec_helper'


feature 'user adds workouts', %Q{
  As an authenticated user
  I want to add a workout to my tracker
  So that I have a datapoint in my workout progress tracker
  } do

  # ACCEPTANCE CRITERIA
  # * I must select the date the workout was / will be performed
  # * I must specify at least one exercise
  # * I must specify how many sets and reps of the exercise
  # * I can specify the weight at which each set of the exercise is to be performed (not required)

  let(:user) { FactoryGirl.create(:user) }
  let(:exercise) { FactoryGirl.create(:exercise, user_id: user.id) }

  scenario 'specifies valid information' do
    sign_in_as(user)
    exercise
    prev_count = Workout.count
    visit new_workout_path
    select '2013', from: 'workout[workout_date(1i)]'
    select 'October', from: 'workout[workout_date(2i)]'
    select '2', from: 'workout[workout_date(3i)]'
    fill_in 'Sets', with: '5', :match => :prefer_exact
    fill_in 'Weight', with: '50'
    select exercise.name, from: 'Exercise'
    fill_in 'Reps', with: '2'
    click_button 'Create Workout'
    expect(page).to have_content("Workout was successfully added!")
    expect(Workout.count).to eql(prev_count + 1)
  end

  scenario 'no information entered' do
    sign_in_as(user)
    prev_count = Workout.count
    visit new_workout_path
    click_button 'Create Workout'
    expect(page).to have_content("can't be blank")
    expect(Workout.count).to eql(prev_count)
  end

  scenario 'user' do
    sign_in_as(user)
    create_a_workout(exercise)
    visit workouts_path
    expect(page).to have_content(Workout.last.workout_date)
  end


  include PlatformrTestHelpers

end
