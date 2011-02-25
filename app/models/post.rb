class Post < ActiveRecord::Base
	acts_as_taggable

	has_many :comments, :dependent => :destroy
	has_many :topics, :dependent => :destroy
	
	belongs_to :user
	
	validates_presence_of :title, :content
end
