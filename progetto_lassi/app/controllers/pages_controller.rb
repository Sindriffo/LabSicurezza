class PagesController < ApplicationController

	before_action :authenticate_user!	

	def home
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
