class UserObserver < ActiveRecord::Observer
  def after_create(user)
    UserMailer.verification_email(user).deliver
  end
end
