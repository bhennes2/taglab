class Tag < ActiveRecord::Base
	
	belongs_to :user
	
	#self.primary_key = "user_id"
	
	validates :title, :presence => true 
	

end
