require 'spec_helper'


describe Workout do

  it { should have_valid(:workout_date).when(Date.new)}
  it { should_not have_valid(:workout_date).when(nil, '', 'random string')}

  # it 'will not save if combination is unspecified' do
  #  user = FactoryGirl.create(:user)
  #  workout = FactoryGirl.build(:workout)
  #  expect(workout).to_not be_valid
  # end

  # it 'will not save if sets on combination is blank' do
  #  user = FactoryGirl.create(:user)
  #  workout_count = Workout.count
  #  workout = FactoryGirl.create(:workout_with_blank_combination, user: user)
  #  expect(Workout.count).to eql(workout_count)
  # end

end
