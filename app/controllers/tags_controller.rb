class TagsController < ApplicationController
  
  before_filter :authenticate
    
  # GET /tags
  # GET /tags.xml
  def index
    @tags = Tag.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tags }
    end
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
    @tag = Tag.new

	respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tag }
    end
  end

  # GET /tags/1/edit
  def edit
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
	
	# Set the location
	if quicktag.location == 0
		@tag.location = 0
	end
	if quicktag.location == 1
		@tag.location = params[:location]
	end 
	
	@tag.save
				
    #respond_to do |format|
    	#if tag.save
			#format.html { redirect_to(quick_tags_path)}
			#format.html { redirect_to root_url } 
        # format.html { redirect_to(@tag, :notice => 'Tag was successfully created.') }
       	# format.xml  { render :xml => @tag, :status => :created, :location => @tag }
      	#else
      	#	format.html { render :action => "new" }
        #format.xml  { render :xml => @tag.errors, :status => :unprocessable_entity }
    	#end
    #end
  end
  
    
  protected
  
  def authenticate
  	authenticate_or_request_with_http_basic do |username, password|
		username == "admin" && password == "admin"
  	end 
  end
end
