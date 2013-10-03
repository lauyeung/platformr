require 'spec_helper'

describe Superset do

  it { should have_valid(:weight).when(5, 5.5, 25) }
  it { should_not have_valid(:weight).when('string') }

end
