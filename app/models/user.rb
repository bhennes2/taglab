class User < ActiveRecord::Base
	
	has_many :tags
	has_many :quick_tags
	
	#Validation on input
	#validates :age, :numericality => { :only_integer => true, :message => "Please enter your age" }
	#validates :sex, :presence => true
	
	#User name valdation
	validates :username, :uniqueness => true
	
	#Email valdation
	validates :email, :uniqueness => true, :allow_blank => true
	#validates :email, :format => { :with => /\A[a-zA-Z]+\z/,
    #:message => "Only letters allowed" }, :allow_blank => true
	
	
	#Zip code validation
	validates :zip_code, :numericality => { :only_integer => true }, :allow_blank => true
	validates :zip_code, :length => { :is => 5 }, :allow_blank => true
	
	def self.create_with_omniauth(auth)
    	create! do |user|
      		user.provider = auth["provider"]
		    user.uid = auth["uid"]
		    user.first_name = auth["info"]["name"]
			user.username = auth["info"]["username"]
    	end
  	end
	
end
