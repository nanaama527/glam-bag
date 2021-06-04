class UsersController < ApplicationController
    # before_action :set_user, only: [:show, :edit, :update, :destroy, :password_edit, :password_update]
    # before_action :redirect_if_logged_in, only: [:index, :show, :edit, :update, :destroy, :password_edit, :password_update]
    # before_action :redirect_if_not_admin_or_owner, only: [:index, :show, :edit, :update, :destroy, :password_edit, :password_update]

    def index
        # if params [:bag_id]
        #     @user = Bag.find_by(id: params[:bag_id]).users.order(:name)
        # else
        #     @user = User.order(:name)
        # end
        @users = User.all
    end

    def show
        @user = User.find_by(params[:user_id])
        

    end

    def new
        @user = User.new

    end

    def create
        @user = User.new(user_params)
        binding.pry
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            @alert = "Oops! The sign up failed. Wanna try again?"
            @errors = @user.errors.full_messages
            render 'new'
        end
    end

    def edit
    end

    def update
        @user.name = params[:name]
        @user.email = params[:email]
        @user.username = params[:username]
        if @user.save
            redirect_to @user
        else
            @alert = "Update failed..."
            @errors = @user.errors.full_messages
            render 'edit'
        end
    end

    def destroy
        @user.destroy
        redirect_to users_path
    end


    def password_edit
    end

    def password_update
        if params[:password].empty?
            @user.errors.add(:password, message: "This field cannot be blank.")
            @alert = "Your password could not be changed at this time. Please try again."
            @errors = @user.errors.full_messages
            render 'password_edit'
        else
            @user.update(password_params)
            if @user.errors.present?
                @alert = "Your password could not be changed at this time. Please try again."
                @errors = @user.errors.full_messages
                render 'password_edit'
            else
                redirect_to @user, alert: "Your password was changed successfully."
            end
        end
    end

    private

    def set_user
        @user = User.find_by(id: params[:id])
    end

    def user_params
        params.require(:user).permit(:name, :email, :password, :username)
    end

    def password_params
        params.require(:user).permit(:password)
    end
end
