class MinutesController < ApplicationController
  before_filter :authenticate_user!
  # GET /minutes
  # GET /minutes.xml
  def index
    @minutes = Minute.find(:all, :conditions => {:user_id => current_user}, :order => 'minutes.id DESC', :limit => 5)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @minutes }
    end
  end

  # GET /minutes/1
  # GET /minutes/1.xml
  def show
    @minute = Minute.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @minute }
    end
  end

  # GET /minutes/new
  # GET /minutes/new.xml
  def new
    @minute = Minute.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @minute }
    end
  end

  # GET /minutes/1/edit
  def edit
    @minute = Minute.find(params[:id])
  end

  # POST /minutes
  # POST /minutes.xml
  def create
    params[:minute][:content] = '' if params[:minute][:content]=="Enter the action items here, e.g: \r\nEvaluate tools for startups @Joseluis #Tools [19-Sep-2011]\r\nRun a few tests in staging @Rebecca #Tests [Tomorrow]"
    @minute = Minute.new(params[:minute].merge!({:user_id => current_user}))

    respond_to do |format|
      if @minute.save
        # once the minute it's saved then we'll create any tasks
        @tasks = []
        description = params[:minute][:content]
        
        alltasks = description.split(/\r\n/)
        alltasks.each do |task|
          person_assigned = task.scan(/@[\w-]+/)
          if !person_assigned[0].blank?
            person_assigned = person_assigned[0].gsub(/[^0-9A-Za-z]/, '')
          else
            person_assigned = ''
          end
          #logger.debug "====================testing1:#{person_assigned.inspect}========"
          label_task = task.scan(/#[\w-]+/)
          if !label_task[0].blank?
            label_task = label_task[0].gsub(/[^0-9A-Za-z]/, '')
          else
            label_task = ''
          end
          #logger.debug "====================testing2:#{label_task.inspect}========"
          task_description = task.gsub(/@[\w-]+/, '')
          
          due_date = task.scan(/\[(.*)\]+/)
          logger.debug "==================testing3:#{due_date.inspect}==========="
          
          if !due_date[0].blank? && !due_date[0][0].blank?
            due_date = Chronic.parse(due_date[0][0].gsub(/[^0-9A-Za-z]/, ' '))
          else
            due_date = Time.new
          end
          logger.debug "==================testing4:#{due_date.inspect}=============="
          
          if !task_description.blank?
            @tasks << Task.new(:minute_id => @minute.id,:description => task_description, :user_id => current_user, :assigned_name => person_assigned, :due_date => due_date)
          end
          #@task = Task.create!(:minute_id => @minute.id,:description => task_description, :user_id => current_user, :assigned_to => 0, :due_date => due_date)
          
        end
        #logger.debug "=================Testing3:#{@tasks.inspect}========================"
        if @tasks.count>=1
          format.html { render :action => 'create'}
          return
        end
        format.html { redirect_to(@minute, :notice => 'Minute was successfully created.') }
        format.xml  { render :xml => @minute, :status => :created, :location => @minute }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @minute.errors, :status => :unprocessable_entity }
      end
    end
    
  end

  # PUT /minutes/1
  # PUT /minutes/1.xml
  def update
    @minute = Minute.find(params[:id])

    respond_to do |format|
      if @minute.update_attributes(params[:minute])
        format.html { redirect_to(@minute, :notice => 'Minute was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @minute.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /minutes/1
  # DELETE /minutes/1.xml
  def destroy
    @minute = Minute.find(params[:id])
    @minute.destroy

    respond_to do |format|
      format.html { redirect_to(minutes_url) }
      format.xml  { head :ok }
    end
  end
end
