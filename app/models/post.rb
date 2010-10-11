class Post < ActiveRecord::Base
	has_many :comments
	has_many :topics
	
	belongs_to :user
end
