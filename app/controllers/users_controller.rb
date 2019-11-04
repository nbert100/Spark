class UsersController < ApplicationController

    def new
        #getting sign up form
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            #login user
            session[:user_id] = @user.id 
            redirect_to user_path
            #user show page
        else
            #add flash message
            render :new
        end

    end

    def show
        @user = User.find(params[:id])
    end

    private 
    def user_params
        params.require(:user).permit(:name, :email, :password)
    end
end
