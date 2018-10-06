class ApplicationController < ActionController::Base
	helper_method :current_user, :logged_in?

	# before_action :authentication_required
	# skip_before_action :authentication_required, only: [:welcome]
	# protect_from_forgery with: :exception
	# helper_method :current_user, :logged_in?, :contact_to_relationship, :error_msg



	def logged_in?
		!!session[:user_id]
	end

	def current_user
		current_user ||= User.find(session[:user_id])
	end

	def authentication_required 
		if !logged_in? 
			redirect_to root_path 
		end 
	end

	def welcome
	end


end
