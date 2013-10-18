class Notifier < ActionMailer::Base
  default from: "from@example.com"

  def password_reset_email(user)
    @user = user
    mail( :to => @user.email,
    :subject => 'Platformr Password Reset' )
  end
end
