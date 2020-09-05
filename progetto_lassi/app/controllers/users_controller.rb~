class UsersController < ApplicationController

	before_action :authenticate_user!

	def index
		@users = User.all
	end

	def show
		id = params[:id]
		@user = User.find(id)
	end	
	

	def destroy
		id = params[:id]
		@user = User.find(id)
		@user.destroy
        flash[:notice] = "User deleted."
		redirect_to users_path
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

		redirect_to users_path
	end

end
