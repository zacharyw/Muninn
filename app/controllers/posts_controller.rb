class PostsController < ApplicationController
	before_filter :require_user, :except => [:index, :show]
	
	def index
		@posts = Post.paginate(:page => params[:page], :per_page => 3, :order => 'created_at DESC', :include => :comments)
	end
	
	def show
		@post = Post.find(params[:id])
		@comment = Comment.new
	end
	
	def new
	end
	
	def edit
	end
	
	def update
	end
	
	def delete
	end
end
