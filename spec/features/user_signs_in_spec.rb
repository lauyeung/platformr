require 'spec_helper'

feature 'user signs in', %Q{
  As an authenticated user
  I want to sign in
  So that I can track my workout progress
} do

  # ACCEPTANCE CRITERIA
  # * if I specify a valid, previously registered email (or username) and password, I am authenticated and I gain access to the system
  # * If I specify an invalid email (or username) and password, I remain unauthenticated and will be prompted to sign up
  # * If I do not provide an email (or username) and password, I will receive an error
  # * If I am already signed in, I can't sign in again


  let(:user) { FactoryGirl.create(:user) }

  scenario 'user signs out' do

    sign_in_as(user)
    expect(page).to have_content("Signed in successfully.")

  end

  include PlatformrTestHelpers

end
