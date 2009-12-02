class AddVerificationToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :verified_at, :datetime
    add_column :users, :verification_key, :string
  end

  def self.down
    remove_column :users, :verification_key
    remove_column :users, :verified_at
  end
end
