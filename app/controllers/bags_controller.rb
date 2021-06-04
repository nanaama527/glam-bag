class BagsController < ApplicationController
    # before_action :set_bag, only: [:show, :edit, :update ,:destroy]
    # before_action :redirect_if_not_logged_in, only: [:new, :create, :edit, :update, :destroy]
    # before_action :redirect_if_not_admin, only: [:new, :create, :edit, :update, :destroy]
  
    def index
      if params[:user_id]
        @user = current_user
        @bags = Bag.all
      else
        binding.pry
        redirect_to user_path(@user)
      end
    end
  
    def show
      @user = User.find_by(id: params[:user_id])
      @bag = Bag.find_by(id: params[:id])
      @makeup_products_in_this_bag = @bag.makeups
      binding.pry
    end
  
    def new
      @user = current_user
      @bag = @user.bags.build
    end
  
    def create
      @user = current_user
      @bag = @user.bags.build(bag_params)
      if @bag.save
        redirect_to user_bags_path, alert: "Yay! We just made your Glam Bag"
      else
        @alert = "Please make your product selections."
        @errors = @bag.errors.full_messages
        binding.pry
        render 'new'
      end
    end
  
    def edit 
         
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
      @bags.destroy
      redirect_to bags_path
    end
  
  
    private
  
    def set_bag
      @bag = Bag.find_by(id: params[:id])
    end
  
  
    def bag_params
      params.require(:bag).permit(:user_id, :name)
    end
end
