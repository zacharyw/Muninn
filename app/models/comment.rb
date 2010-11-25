class Comment < ActiveRecord::Base
	is_gravtastic :email, :size => 50
	
	belongs_to :post
	
	validates_presence_of :author, :content
end
