class MakeupsController < ApplicationController
    # before_action :redirect_if_not_logged_in, only: [:new, :create, :edit, :update, :destroy]

  def new
    @makeup = Makeup.find_by(id: params[:makeup_id]
  end

  def create
    @makeup = Makeup.new(makeup_params)
    if @makeup.save
      redirect_to new_makeup_bag_path, alert: "Yay! We just made your Glam Bag"
    else
      @alert = "Please make your product selections."
      @errors = @makeup.errors.full_messages
      render 'new'
  end

  def edit
  end

  def update
    @makeup = Makeup.find_by(product: params[:product], user_id: current_user.id)
    @makeup.update(makeup: params[:product][:name])
    redirect_to user_bag_path(current_user)
  end

  def destroy
    @makeup_bags.destroy
    redirect_to bags_path
  end
end
