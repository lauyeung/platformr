require 'spec_helper'

describe ExerciseSet do

  it { should have_valid(:reps).when(5, 25) }
  it { should_not have_valid(:reps).when(nil, '', 'string', 5.5, -1, 1001) }

end
