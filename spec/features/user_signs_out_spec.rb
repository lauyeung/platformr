require 'spec_helper'

feature 'user signs out', %Q{
  As an authenticated user
  I want to sign out
  So that I can avoid others using my account if I share a computer
} do

  # ACCEPTANCE CRITERIA
  # * If I log out, I will go from being an authenticated user and become unauthenticated

  let(:user) { FactoryGirl.create(:user) }

  scenario 'user signs out' do

    sign_in_as(user)
    click_link 'Sign out'
    expect(page).to have_content("Signed out successfully.")

  end

  include PlatformrTestHelpers

end
