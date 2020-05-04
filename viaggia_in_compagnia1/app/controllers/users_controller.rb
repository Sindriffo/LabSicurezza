class UsersController < ApplicationController
    def index
        id = params[:format]
        if id != nil
            redirect_to users_path()
        end
        id = session[:user_id]
        @user = User.find(id)
    end
    
    def show       
        id = params[:id]
        session_id = session[:user_id]

        if session_id != Integer(id)
            redirect_to user_path(User.find(session_id))
        else User.exists?(id)
            @user = User.find(id)
		end
    end

    def edit
    end

end
