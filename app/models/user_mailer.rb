class UserMailer < ActionMailer::Base
  default :from => "notifications@example.com"

  def verification_email(user)
    @user = recipient
    mail(:to => recipient.email_address, 
         :subject => "Please verify your account")
  end
end
