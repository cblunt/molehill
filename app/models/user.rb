class User < ActiveRecord::Base
  attr_accessible :username, :email_address, :password, :password_confirmation
  
  attr_accessor :password

  before_create :reset_verification
  before_save :prepare_password

  has_many :posts
  has_many :votes
  has_many :promoted_posts, :through => :votes, :source => :post, :conditions => ["votes.score >= ?", 1]
  has_many :scored_posts, :through => :votes, :source => :post
  
  validates_uniqueness_of :username
  validates_length_of :username, :minimum => 3
  validates_uniqueness_of :email_address
  validates_format_of :email_address, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i
  validates_presence_of :password, :on => :create
  validates_confirmation_of :password
  validates_length_of :password, :minimum => 4, :allow_blank => true
  
  def self.authenticate(login, pass)
    user = find_by_username(login) || find_by_email_address(login)
    return user if user && user.matching_password?(pass) && user.verified?
  end
  
  def verify_with_key(key)
    update_attribute(:verified_at, Time.now) if key == self.verification_key
  end
  
  def matching_password?(pass)
    self.password_hash == encrypt_password(pass)
  end

  def reset_verification
    self.verified_at = nil
    self.verification_key = Digest::SHA2.hexdigest("#{Time.now} #{rand(1000)}")
  end
  
  def verified?
    !self.verified_at.nil?
  end
  
  def promote(post)
    self.votes.create(:post => post, :score => 1)
  end

  def promoted?(post)
    self.promoted_posts.include? post
  end

  def voted?(post)
    self.scored_posts.include? post
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
