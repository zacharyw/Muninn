class ImagesController < ApplicationController
	before_filter :require_user
	
	def new
		@image = Image.new
	end
	
	def create
		@image = Image.create(params[:image])
		
		redirect_to :show
	end
	
	def show
		@image = Image.find(params[:id])
	end
	
	def index
		@images = Image.order("created_at DESC").all
	end
	
	def destroy
		@image = Image.find(params[:id])
		@image.destroy
		
		redirect_to :action => :index
	end
end
