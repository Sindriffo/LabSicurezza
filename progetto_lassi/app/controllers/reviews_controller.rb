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


end
