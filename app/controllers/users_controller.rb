class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    before_action :require_user, only: [:edit, :update]
    before_action :require_same_user, only: [:edit, :update, :destroy]

    def show
        #@books = @user.books #articles belonging to this user instance
        @books = @user.books.paginate(page: params[:page], per_page: 4)
    end

    def index
       # @users =User.all  
       @users = User.paginate(page: params[:page], per_page: 4)
    end
    
    def new
        @user = User.new
    end

    def edit
    end

    def update
        if @user.update(user_params) #if updated is successful, send message to user
            flash[:notice] = "Your account information was successfully updated"
            redirect_to @user
        else   
            render 'edit' #show the form again
        end
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            flash[:notice] = "Welcome to Read It! #{@user.username}- you have successfully signed up"
            redirect_to books_path
        else   
            render 'new' #show the form again
        end
    end

    def destroy
        @user.destroy
        session[:user_id] = nil if @user == current_user
        flash[:notice] = "Account and all books successfully deleted"
        redirect_to books_path
    end

    private
    def user_params
        params.require(:user).permit(:username, :email, :password)
    end

    def set_user
        @user = User.find(params[:id])
    end

    def require_same_user
        if current_user != @user && !current_user.admin?
            flash[:alert] = "You can only edit or delete your own account"
            redirect_to @user
        end
    end
end