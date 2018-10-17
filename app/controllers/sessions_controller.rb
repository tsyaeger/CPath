class SessionsController < ApplicationController 
	skip_before_action :authentication_required, only: [:new, :create]
  
	def new
		@user = User.new
	end

	def create 
		@user = User.new
		@user = User.find_by(:username => params[:username])
		if @user #&& @user.authenticate(params[:password_digest])
			session[:user_id] = @user.id 
			redirect_to user_path(@user)
		else 
			flash[:notice] = "I couldn't find that username/password combo"
			render :new
		end
	end 


	def destroy 
		reset_session
		redirect_to root_path 
	end



end

