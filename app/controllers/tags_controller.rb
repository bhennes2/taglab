class TagsController < ApplicationController
  
  before_filter :authenticate
    
  # GET /tags
  # GET /tags.xml
  def index
    @title = "View tags"
	@today = DateTime.now
	@current_week = @today.cweek
	@start_day_week = @today.beginning_of_week
	@stop_day_week = @today.end_of_week
	@tags = Tag.where("user_id = :current_user AND created_at >= :start_date AND created_at <= :end_date", 
		{:current_user => current_user.id, :start_date => @start_day_week, :end_date => @stop_day_week}).paginate(:per_page => 10, :page => params[:page])

	@start = @start_day_week.strftime("%b %-d")
	@stop = @stop_day_week.strftime("%b %-d")
		
	if request.xhr?
		sleep(2)
		render :partial => @tags
	end
    #respond_to do |format|
      #format.html # index.html.erb
      #format.xml  { render :xml => @tags }
    #end
  end

  # GET /tags/1
  # GET /tags/1.xml
  def show
    @tag = Tag.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tag }
    end
  end

  
  # GET /tags/new
  # GET /tags/new.xml
  def new
  	@title = "Add Tag"
    @tag = Tag.new

	respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tag }
    end
  end

  # GET /tags/1/edit
  def edit
  	@title = "Edit Tag"
    @tag = Tag.find(params[:id])
  end

  # POST /tags
  # POST /tags.xml
  def create
    @tag = Tag.new(params[:tag])

    respond_to do |format|
      if @tag.save
	  	format.html { redirect_to(tags_path) }
        #format.html { redirect_to(@tag, :notice => 'Tag was successfully created.') }
        format.xml  { render :xml => @tag, :status => :created, :location => @tag }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tag.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tags/1
  # PUT /tags/1.xml
  def update
    @tag = Tag.find(params[:id])

    respond_to do |format|
      if @tag.update_attributes(params[:tag])
	  	format.html { redirect_to(edit_tag_path(@tag)) }
        #format.html { redirect_to(@tag, :notice => 'Tag was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tag.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tags/1
  # DELETE /tags/1.xml
  def destroy
  		
	@tag = Tag.find(params[:id])
    @tag.destroy
		
    respond_to do |format|
      format.html { redirect_to(tags_path) }
      format.xml  { head :ok }
    end
  end
  
  # POST /tags
  # POST /tags.xml
  def quicktag
  
  	# Initialize a new tag
    @tag = Tag.new
	# Set tag user_id to id of current_user
	@tag.user_id = params[:user_id]
	
	# Set title equal to quicktag title
	quicktag = QuickTag.find(params[:id])
	@tag.title = quicktag.title
	
	# Set the time equal to the current time
	@tag.time = Time.now.utc.to_i
	@tag.date = Time.now.utc.to_date
	
	# Set the location
	if quicktag.location == 0
		@tag.location = 0
	elsif quicktag.location == 1
		@tag.location = params[:location]
	end 
	
	@tag.save

	@title = "View tags"
	@today = DateTime.now
	@current_week = @today.cweek
	@start_day_week = @today.beginning_of_week
	@stop_day_week = @today.end_of_week
	@tags = Tag.where("user_id = :current_user AND created_at >= :start_date AND created_at <= :end_date", 
		{:current_user => current_user.id, :start_date => @start_day_week, :end_date => @stop_day_week}).paginate(:per_page => 10, :page => params[:page])

	@start = @start_day_week.strftime("%b %-d")
	@stop = @stop_day_week.strftime("%b %-d")
		
  end
  
  def tagsday
  	@title = "Day tags"
  	@tags = Tag.paginate :per_page => 10, :page => params[:page],
						 :conditions => { :date => Time.at(params[:time].to_i).to_date,
										  :user_id => current_user.id },
						 :order => 'tags.time DESC'	

    respond_to do |format|
		format.html
		format.js		 
	end
	
  end 
  
  def week
  	@title = "View tags"
	@current_week = params[:week].to_i + params[:type].to_i
	
	@day = DateTime.now + 6*(@current_week - DateTime.now.cweek)
	@start_day_week = @day.beginning_of_week
	@stop_day_week = @day.end_of_week
	
	@tags = Tag.where("user_id = :current_user AND created_at >= :start_date AND created_at <= :end_date", 
		{:current_user => current_user.id, :start_date => @start_day_week, :end_date => @stop_day_week}).paginate(:per_page => 10, :page => params[:page])

	@start = @start_day_week.strftime("%b %-d")
	@stop = @stop_day_week.strftime("%b %-d")
  end

	
  def experiments
  	@title = "Experiments"
	
	@tags = Tag.where(:user_id => current_user).select("DISTINCT title")
  end  
  
  def conduct
  	@title = params[:data_source]
	
	@calc = params[:calculation_type]
	@data = Tag.where(:user_id => current_user, :title => params[:data_source]).select(:time).order("time ASC")
  end
    
  protected
  
  def authenticate
  	authenticate_or_request_with_http_basic do |username, password|
		username == "admin" && password == "admin"
  	end 
  end
end
