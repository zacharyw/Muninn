class UsersController < ApplicationController
	def new
		@user = User.new
	end
	
	def create
    @user = User.new(params[:user])
    
    if @user.save
      flash[:notice] = "Blog created successfully."
      redirect_to root_url
    else
      redirect_to setup_path
    end
  end
  
  def show
  	@user = User.find(params[:id])
	end
end
