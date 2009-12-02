class UserObserver < ActiveRecord::Observer
  def after_create(user)
    UserMailer.deliver_verification_email(user)
  end
end
