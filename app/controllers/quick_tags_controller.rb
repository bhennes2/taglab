class QuickTagsController < ApplicationController
  # GET /quick_tags
  # GET /quick_tags.xml
  def index
  	@title = "Quick tags"
    @quick_tags = QuickTag.where(:user_id => current_user.id).order("category DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @quick_tags }
    end
  end

  # GET /quick_tags/1
  # GET /quick_tags/1.xml
  def show
    @quick_tag = QuickTag.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @quick_tag }
    end
  end

  # GET /quick_tags/new
  # GET /quick_tags/new.xml
  def new
    @quick_tag = QuickTag.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @quick_tag }
    end
  end

  # GET /quick_tags/1/edit
  def edit
  	@title = "Edit Quick tag"
    @quick_tag = QuickTag.find(params[:id])
  end

  # POST /quick_tags
  # POST /quick_tags.xml
  def create
    @quick_tag = QuickTag.new(params[:quick_tag])

    respond_to do |format|
      if @quick_tag.save
        format.html { redirect_to(quick_tags_path)}
		#format.html { redirect_to(@quick_tag, :notice => 'Quick tag was successfully created.') }
        format.xml  { render :xml => @quick_tag, :status => :created, :location => @quick_tag }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @quick_tag.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /quick_tags/1
  # PUT /quick_tags/1.xml
  def update
    @quick_tag = QuickTag.find(params[:id])

    respond_to do |format|
      if @quick_tag.update_attributes(params[:quick_tag])
        format.html { redirect_to(quick_tags_path)}
		#format.html { redirect_to(@quick_tag, :notice => 'Quick tag was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @quick_tag.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /quick_tags/1
  # DELETE /quick_tags/1.xml
  def destroy
    @quick_tag = QuickTag.find(params[:id])
    @quick_tag.destroy

    respond_to do |format|
      format.html { redirect_to(quick_tags_url) }
      format.xml  { head :ok }
    end
  end
end
