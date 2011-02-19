class User < ActiveRecord::Base
	acts_as_authentic
	has_many :posts, :dependent => :destroy
	
	def title
		if read_attribute("title")
			read_attribute("title")
		else
			"Muninn"
		end
	end
end
