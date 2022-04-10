class ApplicationController < ActionController::Base
    include SessionHelper    
    before_action :fetch_user

    add_flash_types :danger, :info, :warning, :success, :messages


    private
    
end
