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
		@post = Post.find(params[:id])
	end
	
	def update
		@post = Post.find(params[:id])
		
		if @post.update_attributes(params[:post])
			redirect_to( @post, :notice => 'Post updated successfully.')
		else
			render :action => "edit"
		end
	end
	
	def delete
		@post = params[:post]
		
		if @post.destroy
			redirect_to( root_path, :notice => 'Post was successfully deleted.')
		else
			redirect_to(@post)
		end
	end
end
