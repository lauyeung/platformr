require 'spec_helper'


feature 'user signs up', %Q{
  As an unauthenticated user
  I want to sign up
  So that I can track my workout progress
  } do

  # ACCEPTANCE CRITERIA
  # * I must specify a unique username
  # * I must specify a valid email address
  # * I must specify a password, and confirm that password
  # * If I do not perform the above, I get an error message
  # * If I specify valid information, I register my account and am authenticated

  scenario 'user does not specify valid information' do
    prev_count = User.count
    visit '/'
    within(".nav") do
      click_link 'Sign up'
    end
    click_button 'Sign up'
    expect(User.count).to eql(prev_count)
    expect(page).to have_content("Please review the problems")
    expect(page).to have_content("can't be blank")
  end

  scenario 'user specifies information that has previously been entered' do
    user = FactoryGirl.create(:user)
    prev_count = User.count
    visit '/'
    within(".nav") do
      click_link 'Sign up'
    end
    within(".form-inputs") do
      fill_in 'Username', with: user.username
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password, :match => :prefer_exact
      fill_in 'Password confirmation', with: user.password_confirmation, match: :prefer_exact
    end
    click_button 'Sign up'
    expect(User.count).to eql(prev_count)
    expect(page).to have_content("Please review the problems")
    expect(page).to have_content("already been taken")
  end


end
