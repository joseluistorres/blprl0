class Minute < ActiveRecord::Base
  validates :content, :presence => true, :allow_blank => false
  validates :name, :presence => true, :allow_blank => false
  belongs_to :user
  has_many :tasks
  
  def get_tasks_from_description(description, current_user)
    @tasks = []
    unless description.blank?
      alltasks = description.split(/\r\n/)
      alltasks.each do |task|
        person_assigned = task.scan(/@[\w-]+/)
        if !person_assigned[0].blank?
          person_assigned = person_assigned[0].gsub(/[^0-9A-Za-z]/, '')
        else
          person_assigned = ''
        end
      
        label_task = task.scan(/#[\w-]+/)
        if !label_task[0].blank?
          label_task = label_task[0].gsub(/[^0-9A-Za-z]/, '')
        else
          label_task = ''
        end
      
        task_description = task.gsub(/@[\w-]+/, '')
      
        due_date = task.scan(/\[(.*)\]+/)
      
        if !due_date[0].blank? && !due_date[0][0].blank?
          due_date = Chronic.parse(due_date[0][0].gsub(/[^0-9A-Za-z]/, ' '))
        else
          due_date = Time.new
        end
      
      
        if !task_description.blank?
          @tasks << Task.create!(:minute_id => self.id,:description => task_description, :user_id => current_user, :assigned_name => person_assigned, :due_date => due_date, :preview_mode => 1)
        end
        #@task = Task.create!(:minute_id => @minute.id,:description => task_description, :user_id => current_user, :assigned_to => 0, :due_date => due_date)
      
      end #unless
      
      @tasks
      
    end
  end
end
