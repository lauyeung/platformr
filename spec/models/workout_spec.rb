require 'spec_helper'


describe Workout do

  it { should have_valid(:workout_date).when(Date.new)}
  it { should_not have_valid(:workout_date).when(nil, '', 'random string')}


end
