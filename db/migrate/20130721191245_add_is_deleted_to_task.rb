class AddIsDeletedToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :is_deleted, :boolean, :default => false
  end
end
