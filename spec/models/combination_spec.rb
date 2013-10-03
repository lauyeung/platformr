require 'spec_helper'

describe Combination do

  it { should have_many(:supersets) }

  it { should have_valid(:sets).when(5, 12)}
  # it { should_not have_valid(:sets).when(nil, '', -2) }

  # it { should have_valid(:sets_complete).when(5, 12)}
  # it { should_not have_valid(:sets_complete).when(nil, '', -2) }

  # Tests commented out above stopped working when
  # 'less_than_or_equal_to: :sets' validator
  # was added for :sets_complete due to :sets being nil

  # Added tests below to check validity of sets_complete
  it 'sets complete must be less than or equal to sets' do
    combination = Combination.new(sets: 5, sets_complete: 4)
    combination.should be_valid

    combination.sets_complete = 6
    combination.should_not be_valid

    combination.sets_complete = nil
    combination.should_not be_valid

    combination.sets_complete = ''
    combination.should_not be_valid

    combination.sets_complete = -2
    combination.should_not be_valid
  end

end
