class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :task_id
      t.integer :user_id
      t.integer :like_count

      t.timestamps
    end
  end
end
