require 'spec_helper'

describe User do
  it { should have_many(:workouts) }
  it { should have_many(:exercises) }

  describe 'valid username' do
    it { should_not have_valid(:username).when(nil, '', 'hello moto') }
    it { should have_valid(:username).when('jamesbond','hellokitty12','_happy_')}

  end

  describe 'validates the uniqueness of username (case insensitive)' do
    let(:prev_user) { FactoryGirl.create(:user) }

# WHY IS THIS NOT WORKING?!?!?!?!?! SOMETIMES FAILS - same with exercise spec
# Failure/Error: let(:prev_user) { FactoryGirl.create(:user) }
# ActiveRecord::RecordInvalid:
# Validation failed: Email has already been taken, Email has already been taken, Username has already been taken
    it 'does not allow the same username to be used' do
      user = FactoryGirl.build(:user, username: prev_user.username)
      expect(user).to_not be_valid
    end

    it 'does not allow the same username to be used even if it is a different case' do
      user = FactoryGirl.build(:user, username: prev_user.username.upcase)
      expect(user).to_not be_valid
    end
  end

  describe 'validates the uniqueness of email (case insensitive)' do
    let(:prev_user) { FactoryGirl.create(:user) }

    it 'does not allow the same email to be used' do
      user = FactoryGirl.build(:user, email: prev_user.email)
      expect(user).to_not be_valid
    end

    it 'does not allow the same email to be used even if it is a different case' do
      user = FactoryGirl.build(:user, email: prev_user.email.upcase)
      expect(user).to_not be_valid
    end
  end
end
