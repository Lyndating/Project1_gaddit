class SessionController < ApplicationController
  def new
  end

  def create
    user = User.find_by :email => params[:email]
    if user.present? && user.authenticate(params[:password])
      if params[:remember_me]
        cookies.signed[:user_id] = {value: @user.id, expires: 2.weeks.from_now}
      else
        cookies.signed[:user_id] = @user.id
      end
      session[:user_id] = user.id
      redirect_to login_path
    else
      flash[:notice] = "Invalid email/password combination"
      render :new
    end
  end 


  def destroy
    session[:user_id] = nil
    cookies.delete :user_id
    redirect_to login_path
  end

end
