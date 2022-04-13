class UsersController < ApplicationController
  before_action :check_for_login
  def new
    @user = User.new
  end

  def create
    @user = User.new user_params 
    if @user.save
      redirect_to users_path, :flash[:success] => "Your Account was Created Successfully!"
    else 
      render :new, :flash[:danger] => "Invalid email/password combination" 
    end
  end

  def edit
    if !params[:files].nil?
      params[:files].each do |file|
        @image = file
      end
    end
  end


  def show
    @user = User.find(@current_user.id)
    @posts = @user.posts.all.paginate(page: params[:page], per_page: 10)
  end

  def index
    @users = User.paginate(page: params[:page])
  end

  private
  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end
end
