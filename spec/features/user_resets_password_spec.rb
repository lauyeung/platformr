require 'spec_helper'

feature 'user requests password', %Q{
  As a user who has an account
  I want to reset my forgotten password
  So that I can access my account
} do

  # ACCEPTANCE CRITERIA
  # * I can reset my password

  let(:user) { FactoryGirl.create(:user) }

  scenario 'user resets their password' do
    #clear out mail deliveries
    ActionMailer::Base.deliveries = []

    existing_user = user
    visit new_user_session_path
    expect(page).to have_content("Forgot your password?")
    click_link "Forgot your password?"
    fill_in 'Email', with: existing_user.email
    click_button "Send me reset password instructions"

    #expect email details pertaining to the confirmation
    expect(ActionMailer::Base.deliveries.size).to eql(1)
    last_email = ActionMailer::Base.deliveries.last
    expect(last_email).to have_subject('Platformr Password Reset')
    expect(last_email).to deliver_to(existing_user.email)
  end

  include PlatformrTestHelpers

end
