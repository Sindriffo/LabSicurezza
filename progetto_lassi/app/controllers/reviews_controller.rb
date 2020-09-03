class ReviewsController < ApplicationController
    def index
        travel_id = params[:format]


        @users = []
        @user = Travel.find(travel_id).user
        if @user != current_user
            @users << @user
        end

        @other_users = User.joins(:joinedtravels).where("joinedtravels.travel_id == ?", travel_id).where("user_id != ?", current_user.id)


        @other_users.each do |user|
                @users << user
        end	
    end

    def update
        travel_id = params[:id]
        # render html: travel_id

        @travel = Travel.find(travel_id)
        
        if @travel.user_id == current_user.id
            @travel.rated = true
            # @travel.save
        else
            @joinedtravel = Joinedtravel.where("joinedtravels.travel_id == ?", travel_id).where("joinedtravels.user_id == ?", current_user.id).first 
            @joinedtravel.rated = true
            # @joinedtravel.save
        end


        redirect_to joinedtravels_path
    end

end
