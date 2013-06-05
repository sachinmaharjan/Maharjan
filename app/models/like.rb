class Like < ActiveRecord::Base
  attr_accessible :id, :like_count, :task_id, :user_id
  belongs_to :user
  belongs_to :task
end
