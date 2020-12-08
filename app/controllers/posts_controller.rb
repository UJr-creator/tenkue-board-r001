class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[new edit update create destroy]
  before_action :set_post, only: %i[edit show update destroy]
  before_action :ensure_correct_user, only: %i[edit update destory]

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

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to root_url
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to post_url
    else
      render :edit
    end
  end
  
  def destroy
    @post.destroy
    redirect_back(fallback_location: root_path)
  end
  
  private
  def set_post
    @post = Post.find(params[:id])
  end

  def ensure_correct_user
    @post = current_user.posts.find_by(id: params[:id])
    unless @post
      redirect_to root_url
    end
  end

  def post_params
    params.require(:post).permit(:content)
  end
end
