module SessionHelper
    def log_in(user)
        session[:user_id] = user.id
    end 

    def fetch_user
        @current_user = User.find_by :id=> session[:user_id] if session[:user_id].present? 
        session[:user_id] = nil unless @current_user.present? 
    end

    def check_for_login
        redirect_to login_path unless @current_user.present? || @current_user.nil?
    end
    
end
