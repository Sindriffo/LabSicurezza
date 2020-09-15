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
				@travels = Travel.where('travels.user_id != ?', @user.id).where('travels.data >= ?', DateTime.tomorrow).where('travels.posti_disponibili > ?', 0)

				#All travels the user joined
				@joined_travels = Travel.joins(:joinedtravels).where('joinedtravels.user_id == ?', @user.id).where('travels.posti_disponibili > ?', 0)


				@travels -= @joined_travels
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
		@travel.update('arrivo' => params[:address][:arrivo]) 
		@travel.user_id = current_user.id
		# @travel.arrivo = params[:address][:destinazione] 
		

		@part_query = params[:address][:partenza]
		@arri_query = params[:address][:arrivo]


		@client = OpenStreetMap::Client.new
		@partenza = @client.search(q: @part_query, format: 'json', accept_language: 'it')
        @address = @client.reverse(format: 'json', lat: @partenza[0]['lat'], lon: @partenza[0]['lon'], accept_language: 'it')['address']

        @area
        if @address['county'] != nil
            @area = @address['county'].to_s
        else 
            @area = @address['city'].to_s
        end
		@travel.update('area_partenza' => @area)


		@arrivo = @client.search(q: @arri_query, format: 'json', accept_language: 'it')
        @address = @client.reverse(format: 'json', lat: @arrivo[0]['lat'], lon: @arrivo[0]['lon'], accept_language: 'it')['address']
        @area
        if @address['county'] != nil
            @area = @address['county'].to_s
        else 
            @area = @address['city'].to_s
        end
		@travel.update('area_arrivo' => @area)

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
