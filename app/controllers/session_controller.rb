class SessionController < ApplicationController
  def new
  end

  def create
    @user = User.find_by :email => params[:email]
    puts "here in session controller"
    if @user && @user.authenticate(params[:password])
      log_in @user
      puts @user
      redirect_to user_path(@user)
    else
      render :new, :danger => "Invalid email/password combination"
    end
  end 


  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end

end
