class AddCompletedFieldsToPost < ActiveRecord::Migration
  def self.up
    add_column :posts, :completed_at, :datetime
    add_column :posts, :declined_at, :datetime
  end

  def self.down
    remove_column :posts, :declined_at
    remove_column :posts, :completed_at
  end
end
