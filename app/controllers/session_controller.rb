class SessionController < ApplicationController
  def new
  end

  def create
    user = User.find_by :email => params[:email]
    if user && user.authenticate(params[:password])
      log_in user
      redirect_to users
    else
      flash.now[:danger] = "Invalid email/password combination"
      render :new
    end
  end 

  def destroy
  end

end
