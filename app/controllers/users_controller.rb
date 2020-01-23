require 'pry'

class UsersController < ApplicationController
  before_action :admin_access, only: [:destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "You've successfully signed up!"
      session[:user_id] = @user.id
      redirect_to users_path(@user)
    else
      flash[:alert] = "There was a problem signing up."
      redirect_to '/signup'
    end
  end

  def index
    @users = User.all
    render :index
  end

  def edit
    @user = User.find(params[:id])
    # @user = User.find(params[:user_id])
    render :edit
  end

  def show
    @user = User.find(params[:id])
    # @users = User.all
    @posts = @user.posts
    render :show
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "Updated!"
      redirect_to users_path
    else
      flash[:alert] = "There was a problem updating."
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    # @posts = Post.all()
    @user.destroy
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :password, :password_confirmation, :admin)
  end
end
