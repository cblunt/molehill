class UserMailer < ActionMailer::Base

  def verification_email(user)
    from            "Notifications <notifications@chrisblunt.com>"
    recipients      "#{user.email_address}"
    subject         "Please verify your account"
    body            :user => user
  end

end
