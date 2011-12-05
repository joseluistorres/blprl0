class TasksController < ApplicationController
  uses_tiny_mce
  before_filter :authenticate_user!
  # GET /tasks
  # GET /tasks.xml
  def index
    @minute =  Minute.find(params[:minute_id])
    @tasks = @minute.tasks.that_are_available
    @get_people_names_assigned = @minute.tasks.get_people_names_assigned.map(&:assigned_name)
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tasks }
    end
  end

  # GET /tasks/1
  # GET /tasks/1.xml
  def show
    @task = Task.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @task }
    end
  end

  # GET /tasks/new
  # GET /tasks/new.xml
  def new
    @minute =  Minute.find(params[:minute_id])
    @task = Task.new(:minute_id => @minute.id)
    @get_people_names_assigned = @minute.tasks.get_people_names_assigned.map(&:assigned_name)
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @task }
    end
  end

  # GET /tasks/1/edit
  def edit
    @task = Task.find(params[:id])
  end

  # POST /tasks
  # POST /tasks.xml
  def create
    @task = Task.new(params[:task])
    @task.minute_id = params[:minute_id]
    @task.preview_mode = false
    @task.user_id = current_user.id
    @task.assigned_name = params[:text_person_to_be_assigned] || params[:person_to_be_assigned] || ''  if !params[:text_person_to_be_assigned].blank?
        
    respond_to do |format|
      if @task.save
        format.html { redirect_to(minute_tasks_path(@task.minute), :notice => 'Task was successfully created.') }
        format.xml  { render :xml => @task, :status => :created, :location => @task }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @task.errors, :status => :unprocessable_entity }
      end
    end
  end

  def create_multiple
     
     @tasks = Task.find(params[:task_ids])
       @tasks.each do |task|
         task.update_attributes!(:preview_mode => false)
       end
       flash[:notice] = "Updated tareas!"
       redirect_to minutes_path
  end
  # PUT /tasks/1
  # PUT /tasks/1.xml
  def update
    @task = Task.find(params[:id])
    if params[:status]=='1'
      @task.status = (@task.status) ? 0 : 1
      @task.save!
    end
    if params['due_date_' + @task.id.to_s]
      params[:task][:due_date] = params['due_date_' + @task.id.to_s]
    end
    if params[:r]=='1'
      @task.assigned_name = ''
      @task.save!
      render :update do |page|
      end
      return
    end
    
    if params[:person_to_be_assigned] and !params[:person_to_be_assigned].blank?
      params[:task][:assigned_name] = params[:person_to_be_assigned]
    end
    if params[:text_person_to_be_assigned] and !params[:text_person_to_be_assigned].blank?
      params[:task][:assigned_name] = params[:text_person_to_be_assigned]
    end
    
    
    logger.debug "==============testing123:#{params.inspect}==========="
    
    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.js
        format.html { redirect_to(minute_tasks_path(@task.minute), :notice => 'Task was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @task.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.xml
  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to(minute_tasks_path(@task.minute)) }
      format.xml  { head :ok }
    end
  end
end
