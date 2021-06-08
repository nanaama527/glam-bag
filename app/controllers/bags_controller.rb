class BagsController < ApplicationController
    # before_action :set_bag, only: [:show, :edit, :update ,:destroy]
    # before_action :redirect_if_not_logged_in, only: [:new, :create, :edit, :update, :destroy]
    # before_action :redirect_if_not_admin, only: [:new, :create, :edit, :update, :destroy]
  
    def index
      if params[:user_id]
        @user = User.find_by(id: params[:user_id])
        @bags = @user.bags
      else
        redirect_to user_path(@user)
      end
    end
  
    def show
      @user = User.find_by(id: params[:user_id])
      @bag = Bag.find_by(id: params[:id])
      @makeup_products_in_this_bag = @bag.makeups
  
    end
  
    def new
      @user = User.find_by(id: params[:user_id])
      @bag = @user.bags.build
    end
  
    def create
      @user = User.find_by(id: params[:user_id])
      @bag = @user.bags.build(bag_params)
      if @bag.save
        redirect_to user_bags_path, alert: "Yay! We just made your Glam Bag"
      else
       flash[:alert]  = "Please make your product selections."
        @errors = @bag.errors.full_messages
        render 'new'
      end
    end
  
    def edit 
      @bag = Bag.find_by(id: params[:id])
      if logged_in? && (current_user.id == @bag.user_id)
        @bag.edit
      else
        flash[:alert] = "Umm... that's not your bag, Glam babe. You can only edit bags that are yours. try again."
      end
      redirect_to users_path
    end
  
    def update    
      @bag.update(bag_params)
      if @bag.save
        redirect_to @bag, alert: "Yay! Your Glam Bag was updated!"
      else
        @alert = "Please make your product selections."
        @errors = @bag.errors.full_messages
        render 'edit'
      end
    end
  
    def destroy
      @bag = Bag.find_by(id: params[:id])
      if logged_in? && (current_user.id == @bag.user_id)
        @bag.destroy
      else
        @alert = "Umm... that's not your bag, Glam babe. You can only delete bags that are yours. try again."
      end
      redirect_to users_path
    end
  
  
    private
  
    def set_bag
      @bag = Bag.find_by(id: params[:id])
    end
  
  
    def bag_params
      params.require(:bag).permit(:user_id, :name)
    end
end
