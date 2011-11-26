class Task < ActiveRecord::Base
  belongs_to :minute
  belongs_to :user
  
  scope :that_are_available, where("tasks.preview_mode=0").order("status ASC")
  scope :that_are_available_and_done, where("tasks.preview_mode=0 and tasks.status=1") 

end
