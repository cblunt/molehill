class UserMailer < ActionMailer::Base
  default :from => "notifications@example.com"

  def verification_email(user)
    @user = user
    mail :to => @user.email_address, :subject => "Please verify your account"
  end
end
