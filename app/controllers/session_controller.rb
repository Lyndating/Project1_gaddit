class SessionController < ApplicationController
  def new
  end

  def create
    @user = User.find_by :email => params[:email]
    puts "here in session controller"
    if @user && @user.authenticate(params[:password])
      log_in @user
      puts @user
      redirect_to user_homepage_path
    else
      flash[:notice] = "Invalid email/password combination"
      render :new
    end
  end 


  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end

end
