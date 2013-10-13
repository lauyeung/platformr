module PlatformrTestHelpers

  def sign_in_as(user)
    visit '/'
    within(".dropdown") do
      fill_in 'Username or email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Sign in'
    end
  end

end
