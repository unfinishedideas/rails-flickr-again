require 'pry'

class PostsController < ApplicationController
  before_action :authorize, only: [:new, :edit, :update, :create, :destroy]

  def index
    @posts = Post.all
    # binding.pry
    render :index
  end

  def new
    @user = User.find(params[:user_id])
    @post = Post.new
    render :new
  end

  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.new(post_params)
    if @post.save
      flash[:notice] = "Post created!"
      redirect_to user_path(@user)
    else
      flash[:alert] = "Post NOT created! :("
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    @user = User.find(params[:user_id])
    render :edit
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    render :show
  end

  def update
    @post= Post.find(params[:id])
    if @post.update(post_params)
      redirect_to user_post_path
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @user = User.find(@post.user_id)
    @users = User.all()
    @post.destroy
    redirect_to user_path(@user)
  end

  def post_params
    params.require(:post).permit(:title, :description)
  end
end
