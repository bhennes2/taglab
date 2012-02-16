class AdminController < ApplicationController
	
	before_filter :authenticate
	
	def index
	
	end
	
	def users
		@users = User.all
		
		respond_to do |format|
      		format.html # index.html.erb
		    format.xml  { render :xml => @users }
    	end
	end
	
	def tags
		@tags = Tag.all
	end
	
	protected
  
  	def authenticate
  		authenticate_or_request_with_http_basic do |username, password|
			username == "admin" && password == "iman00b"
  		end 
  	end
	
end
