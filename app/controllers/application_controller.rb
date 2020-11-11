class ApplicationController < ActionController::Base
    # def hello #first attempt
    #     render html: "Hello world"
    # end
    
    helper_method :current_user, :logged_in?

    def current_user
      @current_user ||= Myuser.find(session[:user_id]) if session[:user_id]
    end
  
    def logged_in?
      !!current_user
    end

    def require_user
      if !logged_in?
        flash[:alert] = "You must be logged in to perform that action"
        redirect_to login_path
      end
    end

end
