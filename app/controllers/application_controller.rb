class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception


    helper_method :logged_in?, :current_user


        def current_user
            @user = User.find_by_id(session[:user_id])
        end


        def logged_in?
            !current_user.nil? 
        end
        
        
        def redirect_if_not_logged_in
            if !current_user
              redirect_to login_path
            end
        end
        

        def redirect_if_not_admin
            if current_user
              if !current_user.admin
                redirect_back fallback_location: user_path(current_user), alert: "You requested the page only the owner can access."
              end
            end
        end
        
        
        def bag_owned?
            if current_user
              current_user == Bag.find_by(id: params[:id]).user
            end
        end
    
        def self_account?
            if params[:id]
              current_user.id == params[:id].to_i
            end
        end


end
