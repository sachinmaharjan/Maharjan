class AddImageLocationUrlsToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :image, :string
    add_column :users, :location, :string
    add_column :users, :urls, :string
  end

  def self.down
    remove_column :users, :urls
    remove_column :users, :location
    remove_column :users, :image
  end
end
