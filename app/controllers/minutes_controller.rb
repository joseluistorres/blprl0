class MinutesController < ApplicationController
  before_filter :authenticate_user!
 
  def dashboard
    @minutes = Minute.find(:all, :conditions => {:user_id => current_user.id}, :order => 'minutes.id DESC')

    respond_to do |format|
      format.html 
      format.xml  { render :xml => @minutes }
    end
  end
  
  def index
    @minutes = Minute.find(:all, :conditions => {:user_id => current_user.id}, :order => 'minutes.id DESC')

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
    params[:minute][:name] = '' if params[:minute][:name]=="Untitled Minute"
    @minute = Minute.new(params[:minute].merge!({:user_id => current_user.id}))

    respond_to do |format|
      if @minute.save
        # once the minute it's saved then we'll create any tasks
        @tasks = @minute.get_tasks_from_description(params[:minute][:content], current_user.id)
        
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
    # checar params[:regenerateTasks]
    @minute = Minute.find(params[:id])

    respond_to do |format|
      if @minute.update_attributes(params[:minute])
        if params[:regenerateTasks]=="1"
          @tasks = @minute.get_tasks_from_description(params[:minute][:content], current_user.id)
        
          if @tasks.count>=1
            format.html { render :action => 'update', :notice => 'Minute was successfully updated.'}
            return
          end
        end
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
