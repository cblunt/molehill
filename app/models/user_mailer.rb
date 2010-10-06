class UserMailer < ActionMailer::Base
  default :from => "Molehill Notifications <notifications@molehill.example.com>"

  def verification_email(recipient)
    @user = recipient
    mail :to => recipient.email_address, :subject => "Please verify your account"
  end
end
