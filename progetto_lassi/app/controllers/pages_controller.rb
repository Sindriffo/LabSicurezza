class PagesController < ApplicationController

	before_action :authenticate_user!	

	def home
		if current_user.sospeso?
			reset_session
			render html: "<h1 style='color:red'>Account temporaneamente sospeso</h1>".html_safe
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
