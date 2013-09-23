require 'spec_helper'

describe User do
  it { should have_many(:workouts) }
  it { should have_many(:exercises) }

  describe 'valid username' do
    it { should_not have_valid(:username).when(nil, '', 'hello moto') }
    it { should have_valid(:username).when('jamesbond','hellokitty12','_happy_')}
  end
end
