class CommentsController < ApplicationController
	before_filter :require_user, :only => [:destroy]
	
	def create
		post = Post.find(params[:post_id])
    post.comments.create(params[:comment])

    redirect_to post_path(post)
	end
	
	def destroy
		post = Post.find(params[:post_id])
    comment = post.comments.find(params[:id])
    if comment.destroy
    	redirect_to post_path(post), :notice => "Comment successfully deleted."
  	else
  		redirect_to post_path(post), :notice => "Unexpected problem attempting to delete comment."
		end
	end
end
