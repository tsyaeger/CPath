class UsersController < ApplicationController
	# skip_before_action :authentication_required, only: [:new, :create]


	def new 
		@user = User.new
	end 


	def create 
	    @user = User.new(user_params)
	    if @user.save 
	      session[:user_id] = @user.id 
	      redirect_to @user
	    else 
	    	render :new
	    end
 	end  


	def show
		@user = User.find(params[:id])
		respond_to do |format|
	      format.html { render :show }
	      format.json { render json: @user, status: 200 }
	    end
	end



 	private

	def user_params
		params.require(:user).permit(:username, :password_digest, :email)
	end

	
end
