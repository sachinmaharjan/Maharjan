class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :user_id
      t.string :headline
      t.datetime :completed_at

      t.timestamps
    end
  end
end
