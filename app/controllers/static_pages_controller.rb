class StaticPagesController < ApplicationController
	skip_before_action :authentication_required, only: [:home]

	def home
		if logged_in?
			redirect_to user_path(current_user)
		end
	end

end