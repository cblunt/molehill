class CreateVotes < ActiveRecord::Migration
  def self.up
    create_table :votes do |t|
      t.integer :user_id
      t.integer :post_id
      t.integer :score

      t.timestamps
    end
  end

  def self.down
    drop_table :votes
  end
end
