class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :post, :counter_cache => true

  validates_presence_of :user_id, :post_id, :score
  validates_numericality_of :score, :between => -1..1

  named_scope :promotions, :conditions => ['score >= ?', 1]
end
