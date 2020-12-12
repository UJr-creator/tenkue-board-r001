class CommentsController < ApplicationController
  before_action :set_comment, only: %i[update edit destoy]

  def create
    @comment = current_user.find_or_create(comment_params)
    if @comment.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
      flash[:notice] = "コメントを(140文字以内で)入力してください"
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
      flash[:notice] = "コメントを(140文字以内で)入力してください"
    end
  end

  private
  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:comment).merge(post_id: params[:post_id])
  end
end
