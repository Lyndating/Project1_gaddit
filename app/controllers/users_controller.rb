class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new user_params 
    if @user.save
      redirect_to users_path, :success => "Your Account was Created Successfully!"
    else 
      render :new, :danger => "Invalid email/password combination" 
    end
  end

  def show
    puts "here", @current_user
    render :show
  end

  private
  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end
end
