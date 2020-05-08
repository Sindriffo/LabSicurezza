class SessionsController < ApplicationController

    skip_before_action :set_current_user

    def login
        if session[:user_id] != nil
            default_path                
        end
    end

    def create
        email = params[:user][:email]
        pass = params[:user][:password]
        @users = User.where(:email => email)

        if @users.length>0
            @user = @users.first
            if @user.password == pass
                session[:user_id]=@user.id
                if @user.id == 0
                    redirect_to admin_index_path()
                else            
                    default_path
                end
            else
                redirect_to login_path 
            end
        else
            redirect_to login_path
        end
    end

    def default_path
        redirect_to users_path()            
    end

    def logout
        session.delete(:user_id)
        redirect_to login_path
    end

end
