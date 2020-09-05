class TravelsController < ApplicationController

	before_action :authenticate_user!

	def index
		id = params[:format]
		if id != nil
			redirect_to travels_path()
		end

		id = current_user.id
		if User.exists?(id)
			@user = User.find(id)

			if @user.admin?
				@future_travels = Travel.where('travels.data >= ?', DateTime.now.midnight)
				@past_travels = Travel.where('travels.data < ?', DateTime.now.midnight)
			else
				
				#All travels created from other users
				@other_user_travels = Travel.where('travels.user_id != ?', @user.id).where('travels.data >= ?', DateTime.now.midnight).where('travels.posti_disponibili > ?', 0)

				#All travels the user joined
				@joined_travels = Travel.joins(:joinedtravels).where('joinedtravels.user_id == ?', @user.id).where('travels.posti_disponibili > ?', 0)


				@travels = []
				@other_user_travels.each do |travel|
					if !(@joined_travels.include? travel)
						@travels << travel
					end
				end		
			end

			#Future NOT joined travels
			# @future_travels = Travel.where('travels.user_id != ?', @user.id).where('travels.data >= ?', DateTime.now)
			# @travels = @future_travels.left_joins(:joinedtravels).where('joinedtravels.user_id != ? OR joinedtravels.user_id is null', @user.id)
		end
	end

	def show
		id = params[:id]
		if Travel.exists?(id)
			@travel = Travel.find(id)
			@conducente = @travel.user
		
			@passengers = User.joins(:joinedtravels).where('joinedtravels.travel_id == ?', @travel.id)
		

			############################################# Open Street Maps Query


			@client = OpenStreetMap::Client.new
			@partenza = @client.search(q: @travel.partenza.to_s, format: 'json', addressdetails: '1', accept_language: 'it')
			
			@arrivo = @client.search(q: @travel.arrivo.to_s, format: 'json', addressdetails: '1', accept_language: 'it')

			# render html: @partenza == []
		else
			render html: 'Travel does not exit'
		end
	end

	def new
		@travel = Travel.new
	end

	def create
		@travel = Travel.new(params[:travel].permit!)
		# @travel.update('partenza' => params[:address][:partenza])
		@travel.update('partenza' => params[:address][:partenza])
		@travel.update('ora_partenza' => params[:travel][:ora_partenza])
		@travel.update('arrivo' => params[:address][:destinazione]) 
		@travel.user_id = current_user.id
		# @travel.arrivo = params[:address][:destinazione] 
		

		# render html: params[:travel][:ora_partenza]

		# @var = params[:address][:partenza]

		# @client = OpenStreetMap::Client.new
		# @partenza = @client.search(q: @var, format: 'json', addressdetails: '1', accept_language: 'it')
		
		# render html: "Luogo: " + @var + " Lat: " + @partenza[0]['lat'].to_s + " Lon: " + @partenza[0]['lon'].to_s
		# @partenza_query
		# 	if @travel.via_partenza != ""
		# 		@partenza_query = @travel.via_partenza.to_s + ", " + @travel.citta_partenza.to_s
		# 	else
		# 		@partenza_query = @travel.citta_partenza.to_s
		# 	end


		if @travel.save
            flash[:notice] = "Travel was added"
            redirect_to root_path
        else
            flash[:notice] = @travel.errors.full_messages
            redirect_to root_path
        end
	end


	def update

	end

	def destroy
		id = params[:id]
		@travel = Travel.find(id)
		
		@all_joined_travels = Joinedtravel.where('joinedtravels.travel_id == ?', id)

		@all_joined_travels.each do |jt|
			jt.destroy
		end
		

		@travel.destroy
		if current_user.admin?
			redirect_to travels_path(@user)
		else
			redirect_to joinedtravels_path(User.find(current_user.id))
		end
	end


end
