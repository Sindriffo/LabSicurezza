class PagesController < ApplicationController

	before_action :authenticate_user!	

	def home
	end

	def new
		@page = Page.new
	end

	def index
		@page = Page.new#(params[:page].permit)
		
		# @a = (@citta == nil)
	end

	def create
		@page = Page.new(params[:page].permit!)
		render html: @page
	end

end
