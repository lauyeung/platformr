require 'spec_helper'

describe Workout do

  it { should have_valid(:workout_date).when(Date.new)}
  it { should_not have_valid(:workout_date).when(nil, '', 'random string')}

  # it 'should order the combinations' do
  #   workout = FactoryGirl.create(:workout, number_of_combinations: 2)

  #   combination_1 = workout.combinations.first
  #   combination_2 = workout.combinations.second
  #   workout.combinations = [combination_2, combination_1]
  #   workout.save!

  #   workout.reload
  #   workout.combinations.should == [combination_1, combination_2]
  # end

end
