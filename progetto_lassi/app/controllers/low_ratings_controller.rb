class LowRatingsController < ApplicationController
	def index
		@users = User.all.where('users.rating < ?', 2).where('users.admin != ?', true)
	end

	
	def update
		id = params[:id]
		@user = User.find(id)
		
		if @user.sospeso?
			@user.sospeso = false
		else
			@user.sospeso = true
		end
		@user.save

		redirect_to low_ratings_path
	end

	def destroy
		id = params[:id]
		@user = User.find(id)
		@user.destroy
        flash[:notice] = "User deleted."
		redirect_to low_ratings_path
	end

end
