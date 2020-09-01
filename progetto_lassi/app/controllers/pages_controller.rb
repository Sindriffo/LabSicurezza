class PagesController < ApplicationController

	before_action :authenticate_user!	

	def home
		if current_user.sospeso?
			reset_session
			render html: "Utente temporaneamente sospeso"
		end
	end

	def new
	end

	def index
		@page = params[:citta_partenza]
	end

	def create
		render html: @page
	end

end
