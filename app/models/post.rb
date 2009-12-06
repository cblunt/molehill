class Post < ActiveRecord::Base
  belongs_to :user
  has_many :votes

  validates_presence_of :body, :user_id

  def score
    score = 0
    self.votes.promotions.collect do |v| 
      score += v.score
    end

    score
  end
end
