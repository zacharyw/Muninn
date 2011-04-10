class UsersController < ApplicationController
	before_filter :require_user, :except => [:new, :create, :show]
	
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
	
	def edit
		@user = User.first
	end
	
	def update
		@user = User.find(params[:id])
		
		respond_to do |format|
			if @user.update_attributes(params[:user])
				format.html {redirect_to root_url}
			else
				format.html {render :action => 'edit'}
			end
		end
	end
end
