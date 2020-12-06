class PostsController < ApplicationController
  # before_action :ensure_correct_user, {only: [:edit, :update, :destroy]}
  before_action :authenticate_user!, only: [:new]
  before_action :set_post, only: %i[edit show]

  def index
    @posts = Post.all
      .includes(:user)
      .order(created_at: :desc)
  end

  def show
    @user = @post.user
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to root_url
    else
      render ("posts/new")
    end
  end

  
  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    redirect_to("/")
  end
  
  private
  def set_post
    @post = Post.find(params[:id])
  end

  def ensure_correct_user
    @post = Post.find_by(id: params[:id])
    if @post.user_id != @current_user.id
      redirect_to("/")
    end
  end

  def post_params
    params.require(:post).permit(:content)
  end
end
