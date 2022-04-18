class UsersController < ApplicationController
  before_action :check_for_login, :except => [:new,:create]
  def new
    @user = User.new
  end

  def create
    @user = User.new user_params 
    @user.avatar = "https://res.cloudinary.com/dgpwctfjt/image/upload/v1650127498/ptrghfmgfjz2qzmabwe4.png"
    
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Your account is created successfully!" 
      redirect_to root_path
    else 
      flash.now[:notice] = "Invalid email/password combination" 
      render :new

    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])

    if params[:file].present?
      req = Cloudinary::Uploader.upload(params[:file])
      puts params[:file]
      user.avatar = req["public_id"]
    end
    user.update_attributes(:avatar => user.avatar)
    redirect_to edit_user_path
  end


  def show
    @user = User.find(@current_user.id)
    @user_posts = []
    @current_user.channels.each do |channel|
      channel.posts.each do |post|
        @user_posts.push(post)
      end
    end
    @posts = @user_posts
  end

  def index
    @users = User.paginate(page: params[:page])
  end

  private
  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation, :avatar)
  end

end
