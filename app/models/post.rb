class Post < ActiveRecord::Base
	has_many :comments
	has_many :topics
	
	belongs_to :user
	
	validates_presence_of :title, :content
end
