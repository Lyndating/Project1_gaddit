class ApplicationController < ActionController::Base
    include RememberMe::Controller  
    before_action :fetch_user
    add_flash_types :danger, :info, :warning, :success, :messages

    private
    def fetch_user
        @current_user = User.find_by :id=> session[:user_id] if session[:user_id].present? 
        session[:user_id] = nil unless @current_user.present? 
    end

    def check_for_login
        redirect_to login_path unless @current_user.present?
    end
end
