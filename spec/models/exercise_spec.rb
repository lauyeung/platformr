require 'spec_helper'

describe Exercise do
  it { should_not have_valid(:name).when(nil, '') }

  describe 'validates the uniqueness of exercise name (case insensitive)' do
    prev_exercise = FactoryGirl.create(:exercise)

    it 'does not allow the same exercise to be input' do
      exercise = FactoryGirl.build(:exercise, name: prev_exercise.name)
      expect(exercise).to_not be_valid
    end
    it 'does not allow the same exercise to be input even if it is a different case' do
      exercise = FactoryGirl.build(:exercise, name: prev_exercise.name.upcase)
      expect(exercise).to_not be_valid
    end
  end

end
