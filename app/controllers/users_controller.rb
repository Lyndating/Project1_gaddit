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
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    if !params[:file].present?
      req = Cloudinary::Uploader.upload(params[:file])
      puts params[:file]
      user.avatar = req["public_id"]
    end
      user.update_attributes(user_params)
      user.save
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
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end

  def remove_channel_from_user
    channel = Channel.find(params[:channel][:id])
    user = channel.users.find(params[:user][:id])
    if user
      channel.users.delete(user)
    end
  end 

end
