require 'spec_helper'

describe Combination do

  it { should have_many(:supersets) }

  it { should have_valid(:sets).when(5, 12)}
  it { should_not have_valid(:sets).when(nil, '', -2) }

  it { should have_valid(:sets_complete).when(5, 12)}
  it { should_not have_valid(:sets_complete).when(nil, '', -2) }

end
