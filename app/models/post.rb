class Post < ActiveRecord::Base
	has_many :comments, :dependent => :destroy
	has_many :topics, :dependent => :destroy
	
	belongs_to :user
	
	validates_presence_of :title, :content
end
