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
		@post = Post.new
	end
	
	def create
		@post = Post.new(params[:post])
		
		if @post.save
			redirect_to( @post, :notice => 'Post was successfully created.')
		else
			render :action => "new"
		end
	end
	
	def edit
	end
	
	def update
	end
	
	def delete
	end
end
