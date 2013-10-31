require 'spec_helper'

describe Combination do

  it { should have_many(:supersets) }

  it { should have_valid(:sets).when(5, 12)}
  it { should_not have_valid(:sets).when(nil, '', -1, 5.5, 1001) }

  describe "#sets_complete" do
    context "when sets is 0" do
      subject { Combination.new(sets: 0) }
      it { should have_valid(:sets_complete).when(0) }
      it { should_not have_valid(:sets_complete).when(nil, '', 1, -1, 5.5, 1001) }
    end

    context "when sets is greater than 0" do
      subject { Combination.new(sets: 10) }
      it { should have_valid(:sets_complete).when(0, 10) }
      it { should_not have_valid(:sets_complete).when(nil, '', 11, -1, 5.5, 1001) }
    end
  end

end
