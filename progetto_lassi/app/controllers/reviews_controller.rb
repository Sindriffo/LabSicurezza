class ReviewsController < ApplicationController
    $users = []

    def index
        travel_id = params[:format]
        $users = []

        @user = Travel.find(travel_id).user
        if @user != current_user
            $users << @user
        end

        @other_users = User.joins(:joinedtravels).where("joinedtravels.travel_id == ?", travel_id).where("user_id != ?", current_user.id)


        @other_users.each do |user|
                $users << user
        end	
    end

    def update
        travel_id = params[:id]
        @travel = Travel.find(travel_id)
        
        ####################Update .rated values
        if @travel.user_id == current_user.id
            @travel.rated = true
            @travel.save
        else
            @joinedtravel = Joinedtravel.where("joinedtravels.travel_id == ?", travel_id).where("joinedtravels.user_id == ?", current_user.id).first 
            @joinedtravel.rated = true
            @joinedtravel.save
        end
        

        $users.each do |user|
            rating_value_string = params[:travel]["rating_" + user.id.to_s]
            if rating_value_string != " "
                rating_value = rating_value_string.to_i
                if user.rating == nil
                    user.rating = rating_value
                    user.ratingnum += 1
                else             
                    temp = user.rating*user.ratingnum + rating_value 
                    user.ratingnum += 1
                    user.rating = temp / user.ratingnum
                end
            end

            segnala_value = params[:travel]["segnala_" + user.id.to_s]
            
            if segnala_value == "si"
                user.segnalato += 1
            end
            
            user.save
        end

        redirect_to joinedtravels_path
    end

end
