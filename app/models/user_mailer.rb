class UserMailer < ActionMailer::Base

  def verification_email(user)
    from            "Molehill Notifications <notifications@#{ActionMailer::Base.default_url_options[:host]}>"
    recipients      "#{user.email_address}"
    subject         "Please verify your account"
    body            :user => user
  end

end
