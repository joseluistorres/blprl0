class Task < ActiveRecord::Base
  validates :description, :presence => true, :allow_blank => false
  belongs_to :minute
  belongs_to :user
  
  scope :that_are_available, where("tasks.preview_mode=0").order("status ASC")
  scope :that_are_available_and_done, where("tasks.preview_mode=0 and tasks.status=1") 
  scope :get_people_names_assigned, where("tasks.preview_mode=0 and tasks.assigned_name!='' and tasks.assigned_name is not null").select('DISTINCT tasks.assigned_name')
end
