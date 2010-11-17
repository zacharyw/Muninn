class PostsController < ApplicationController
	def index
		@posts = Post.paginate(:page => params[:page], :per_page => 3, :order => 'created_at DESC', :include => :comments)
	end
	
	def show
		@post = Post.find(params[:id])
		@comment = Comment.new
	end
	
	def add_comment
	end
end
