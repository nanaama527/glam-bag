class MakeupBagsController < ApplicationController
    
    def index
      if params[:user_id]
        @makeup_bags = User.find_by(id: params[:user_id]).bags.order(name: :desc, makeupbag_id: :desc, user_id: :desc)
      else
        @makeup_bags = Makeup_Bag.all.order(name: :desc, user_id: :desc, makeupba: :desc)
      end
    end
  
    def show
      redirect_to makeup_bags_path if @bag.nil?
      @makeup_bag = MakeupBag.find_by(bag_id: params[:id], user_id: params[:user_id])
    end
  
    def new
      @user = User.find_by(id: params[:user_id])
      @bag = Bag.find_by(id: params[:bag_id])
      @makeup_bag = @bag.makeup_bags.build
    end
  
    def create
      @bag = Bag.find_by(id: params[:bag_id])
      @makeup_bag = @bag.makeup_bags.build(makeup_bag_params)
      if @makeup_bag.save

        flash[:alert] = "Yay! We just added to your Glam Bag"
        redirect_to new_bag_makeup_bag_path(@bag)
      else

        flash[:alert] = "Please make your product selections."
        @errors = @makeup_bag.errors.full_messages
        render 'new'
      end
    end
  
    def edit    
    end
  
    def update    
      @makeup_bag.update(makeup_bag_params)
      if @makeup_bag.save
        flash[:alert] = "Yay! Your Glam Bag was updated!"
        redirect_to makeup_bags_path 
      else
        flash[:alert] = "Please make your product selections."
        @errors = @bag.errors.full_messages
        render 'edit'
      end
    end
  
    def destroy
      @makeup_bags.destroy
      redirect_to bags_path
    end
  
  
    private
  
    def set_makeup_bag
      @makeup_bag = MakeupBag.find_by(id: params[:bag_id])
    end
  
  
    def makeup_bag_params
      params.require(:makeup_bag).permit(:bag_id, :makeup_id, :store_location, :price, :quantity)
    end
end


