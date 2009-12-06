class Post < ActiveRecord::Base
  acts_as_taggable

  belongs_to :user
  has_many :votes

  validates_presence_of :body, :user_id

  before_save :extract_hashtags

  def score
    score = 0
    self.votes.promotions.collect do |v| 
      score += v.score
    end

    score
  end

  def scored?
    ! self.votes.count.zero?
  end

protected
  def extract_hashtags
    self.tag_list = self.body.scan /#[\w\-]+/
  end
end
