class Image < ActiveRecord::Base
	has_attached_file :image
	has_friendly_id :name, :use_slug => true
	
	belongs_to :user
	
	validates_presence_of :name
end
