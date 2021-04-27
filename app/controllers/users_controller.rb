class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params) #if updated is successful, send message to user
            flash[:notice] = "Your account information was successfully updated"
            redirect_to books_path
        else   
            render 'edit' #show the form again
        end
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