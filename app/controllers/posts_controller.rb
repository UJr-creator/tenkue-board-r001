class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :set_post, only: %i[edit show update delete]

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
    if @book.update(post_params)
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
    @post = Post.find_by(id: params[:id])
    if @post.user_id != @current_user.id
      redirect_to root_url
    end
  end

  def post_params
    params.require(:post).permit(:content)
  end
end
