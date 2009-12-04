class Post < ActiveRecord::Base
  belongs_to :user
  has_many :votes

  validates_presence_of :body, :user_id
end
