class AddVoteCountCacheToPosts < ActiveRecord::Migration
  def self.up
    add_column :posts, :votes_count, :integer, :default => 0
    Post.all.each do |p|
      p.update_attribute :votes_count, p.votes.length
    end
  end

  def self.down
    remove_column :posts, :votes_count
  end
end
