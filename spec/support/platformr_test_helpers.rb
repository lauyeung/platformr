module PlatformrTestHelpers

  def sign_in_as(user)
    visit '/'
    within(".dropdown") do
      fill_in 'Username or email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Sign in'
    end
  end

  def create_a_workout(exercise)
    visit new_workout_path
    select '2013', from: 'workout[workout_date(1i)]'
    select 'October', from: 'workout[workout_date(2i)]'
    select '2', from: 'workout[workout_date(3i)]'
    fill_in 'Sets', with: '5', :match => :prefer_exact
    fill_in 'Weight', with: '50'
    select exercise.name, from: 'Exercise'
    fill_in 'Reps', with: '2'
    click_button 'Create Workout'
  end

  # def create_a_workout_with_two_exercises(exercise_1, exercise_2)
  #   visit new_workout_path
  #   select '2013', from: 'workout[workout_date(1i)]'
  #   select 'October', from: 'workout[workout_date(2i)]'
  #   select '2', from: 'workout[workout_date(3i)]'
  #   within('.combination') do
  #     fill_in 'Sets', with: '5', :match => :prefer_exact
  #     fill_in 'Weight', with: '50'
  #     select exercise_1.name, from: 'Exercise'
  #     fill_in 'Reps', with: '2'
  #   end
  #   click_link 'Add a Combination'
  #   click_link 'Add a Complex'
  #   click_link 'Add an Exercise'
  #   within('.combination:nth-child(3)') do
  #     fill_in 'Sets', with: '5', :match => :prefer_exact
  #     fill_in 'Weight', with: '50'
  #     select exercise_2.name, from: 'Exercise'
  #     fill_in 'Reps', with: '2'
  #   end
  #   click_button 'Create Workout'
  # end

end
