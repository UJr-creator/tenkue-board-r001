class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment, only: %i[update edit destroy]
  before_action :comment_correct_user, only: %i[edit update destory]

  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
      flash[:alert] = "コメントを(140文字以内で)入力してください"
    end
  end

  def edit
    @post = @comment.post
    @comments = @post.comments.order(id: :desc)
  end

  def update
    @post = @comment.post
    if @comment.update(comment_params)
      redirect_to post_url(@post)
    else
      redirect_back(fallback_location: root_path)
      flash[:alert] = "コメントを(140文字以内で)入力してください"
    end
  end

  def destroy
    @comment.destroy
    redirect_back(fallback_location: root_path)
  end

  private
  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:comment, :post_id, :user_id)
  end

  def comment_correct_user
    @comment = Comment.find_by(id: params[:id])
    unless @comment.user_id == current_user.id
      redirect_to root_url
    end
  end
end
