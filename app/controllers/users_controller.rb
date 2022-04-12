class UsersController < ApplicationController
  before_action :check_for_login
  def new
    @user = User.new
  end

  def create
    @user = User.new user_params 
    if @user.save
      redirect_to users_path, :messsages => "Your Account was Created Successfully!"
    else 
      render :new, :messages => "Invalid email/password combination" 
    end
  end

  def show
    @user = User.find(@current_user.id)
    render :show
  end

  def index
    @users = User.paginate(page: params[:page])
  end

  private
  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end
end
