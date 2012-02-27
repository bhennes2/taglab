class Tag < ActiveRecord::Base
	
	belongs_to :user
	
	has_attached_file :image
	
	#self.primary_key = "user_id"
	
	validates :title, :presence => true 
	
	validates_attachment_size :image, :less_than => 0.5.megabytes

end
