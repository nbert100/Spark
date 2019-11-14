class SessionsController < ApplicationController
  
    
    def new
        @user = User.new
        
    end

    def create
        @user = User.find_by(email: params[:user][:email])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id 
            redirect_to user_path(@user)
        else
            flash[:error] = "Invalid Login. Please try again."
            redirect_to '/login'
        
        end
    end

    def fbcreate
        @user = User.find_or_create_by(uid: auth['uid']) do |u|
            u.name = auth['info']['name']
            u.email = auth['info']['email']
            u.password = SecureRandom.hex(10)
        end
          session[:user_id] = @user.id
          redirect_to user_path(@user)
    end

    def home
        redirect_to user_path(current_user) if logged_in?
    end

    def destroy
        session.clear
        redirect_to '/'
    end

    private
    
    def auth
        request.env['omniauth.auth']
    end
end