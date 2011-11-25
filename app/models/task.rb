class Task < ActiveRecord::Base
  belongs_to :minute
  belongs_to :user
  
  scope :that_are_available, where("tasks.preview_mode=0")

end
