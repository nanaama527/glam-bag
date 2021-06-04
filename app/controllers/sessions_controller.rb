class SessionsController < ApplicationController
   
    def new  
        redirect_to users_path if logged_in?
        @user = User.new           
    end
    
    def create
        redirect_to current_user if logged_in?
        @user = User.find_by(email: params[:email])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to users_path, alert: "Successfully logged in!"
        else
            @alert = "Umm... you wanna try again, Glam Babe?"
            
            if @user.nil?
                @user = User.new
                @user.errors.add(:email, message: "is not registered.")
            else
                @user.errors.add(:password, message: "does not match.")
            end

            if params[:email].empty?
                @user.errors.messages.delete(:email)
                @user.errors.add(:email, message: "can't be blank.")
            end

            @errors = @user.errors.full_messages

            render 'new'

        end    


        #   @user = User.find_by(email: params[:email])
        #   if  @user && @user.authenticate(params[:password])
        #         session[:user_id] = @user.id
        #         binding.pry 
        #       redirect_to users_path(@user)
        #   else
        #     binding.pry
        #     flash[:message] = "Check yourself, before you wreck yourself wai?"
        #       render login_path       
        #   end
    
    end  

    def login
    end

    
    def google_signin
        redirect_to current_user if logged_in?
        @user = User.find_by(email: auth[:info][:email])
        if @user
          session[:user_id] = @user.id
          redirect_to users_path, alert: "Successfully logged in!"      
        else
          password = SecureRandom.base64(12)
          @user = User.create(name: auth[:info][:name], email: auth[:info][:email], password: password)
          if @user.errors.empty?
            session[:user_id] = @user.id
            session[:tmp_password] = password if @user.password
            redirect_to edit_password_path(@user), alert: "Successfully logged in via Google. Now please set your password for this app."
          else
            @alert = "Google log in failed..."
            render 'new'
          end
        end
    end
    
    
    
    # def omniauth
    #     user = User.create_from_omniauth(auth)
    #     if user.valid?
    #         session[:user_id] = user.id
    #         redirect_to new_bag_path
    #     else
    #         flash[:message] = user.errors.full_messages.join(", ")
    #         redirect_to bags_path
    #     end
    
    #     private
        
    #     def auth
    #         request.env['omniauth.auth']
    #     end
    # end


    def destroy
        session.clear
        redirect_to users_path, alert: "Until next time, Glam Babe!"  
    end

    private

    def auth
      request.env['omniauth.auth']
    end
  
end