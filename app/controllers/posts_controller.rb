class PostsController < ApplicationController
  # before_action :ensure_correct_user, {only: [:edit, :update, :destroy]}            
  before_action :authenticate_user,only: [:edit, :update, :new]
  # before_action :set_user, only: %i[edit show]           

  def index
    @posts = Post.all
              .includes(:user)
              .order(created_at: :desc)
    # 上から順に表示
  end

  def show
    @post =Post.find_by(id:params[:id])
    @user = @post.user
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def create
     @post = Post.new(content: params[:content],user_id: @current_user.id)
    if @post.save
    redirect_to("/posts/index")
  else
    render("posts/new")
  end
end

def set_post
  @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    redirect_to("/posts/index")
  end

  def ensure_correct_user
    @post = Post.find_by(id: params[:id])
    if @post.user_id != @current_user.id
      redirect_to("/posts/index")
    end
  end
end
