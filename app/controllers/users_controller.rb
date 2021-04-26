class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            flash[:notice] = "Welcome to Read It! #{@user.username}- you have successfully signed up"
            redirect_to books_path
        else   
            render 'new' #show the form again
        end
    end

    private
    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
end