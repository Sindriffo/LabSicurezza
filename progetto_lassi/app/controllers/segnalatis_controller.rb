class SegnalatisController < ApplicationController

	def index
		@users = User.all.where('users.segnalato > ?', 0).where('users.admin != ?', true)
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

		redirect_to segnalatis_path
	end

	def destroy
		id = params[:id]
		@user = User.find(id)
		@user.destroy
        flash[:notice] = "User deleted."
		redirect_to segnalatis_path
	end

end
