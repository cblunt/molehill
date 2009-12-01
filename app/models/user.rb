class User < ActiveRecord::Base
  attr_accessible :email_address, :password, :password_confirmation
  
  attr_accessor :password
  before_save :prepare_password
  
  validates_uniqueness_of :email_address, :allow_blank => true
  validates_format_of :email_address, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i
  validates_presence_of :password, :on => :create
  validates_confirmation_of :password
  validates_length_of :password, :minimum => 4, :allow_blank => true
  
  def self.authenticate(email, pass)
    user = find_by_email_address(email)
    return user if user && user.matching_password?(pass)
  end
  
  def matching_password?(pass)
    self.password_hash == encrypt_password(pass)
  end
  
  private
  
  def prepare_password
    unless password.blank?
      self.password_salt = Digest::SHA2.hexdigest([Time.now, rand].join)
      self.password_hash = encrypt_password(password)
    end
  end
  
  def encrypt_password(pass)
    Digest::SHA2.hexdigest([pass, password_salt].join)
  end
end
