class MakeupBagsController < ApplicationController
    
    def index
      if params[:user_id]
        @makeup_bags = User.find_by(id: params[:user_id]).bags.order(name: :desc, makeupbag_id: :desc, user_id: :desc)
      else
        @makeup_bags = Makeup_Bag.all.order(name: :desc, user_id: :desc, makeupbag_id: :desc)
      end
    end
  
    def show
      redirect_to makeup_bags_path if @bag.nil?
      @makeup_bag = MakeupBag.find_by(bag_id: params[:id], user_id: params[:user_id])
    end
  
    def new
      @user = current_user
      @makeup_bag = MakeupBag.new
    end
  
    def create
      @makeup_bag = MakeupBag.new(makeup_bag_params)
      if @makeup_bag.save
        redirect_to new_makeup_bag_path, alert: "Yay! We just made your Glam Bag"
      else
        @alert = "Please make your product selections."
        @errors = @makeup_bag.errors.full_messages
        render 'new'
      end
    end
  
    def edit    
    end
  
    def update    
      @makeup_bag.update(makeup_bag_params)
      if @makeup_bag.save
        redirect_to @makeup_bag, alert: "Yay! Your Glam Bag was updated!"
      else
        @alert = "Please make your product selections."
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


