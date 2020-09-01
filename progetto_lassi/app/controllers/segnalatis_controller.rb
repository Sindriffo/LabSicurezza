class SegnalatisController < ApplicationController

	def index
		@users = User.all
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

end
