class AddFaceebookToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :provider, :string
    add_column :users, :oauth_token, :string
    add_column :users, :oauth_expires_at, :datetime
  end

  def self.down
    remove_column :users, :oauth_expires_at
    remove_column :users, :oauth_token
    remove_column :users, :provider
  end
end
