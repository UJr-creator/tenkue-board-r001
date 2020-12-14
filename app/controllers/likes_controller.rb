class LikesController < ApplicationController
  before_action :set_post

  def create
    like = Like.create(user_id: current_user.id, post_id: @post.id)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    like = current_user.likes.find_by(post_id: @post.id)
    like.destroy
    redirect_back(fallback_location: root_path)
  end

  private
  def set_post
    @post = Post.find(params[:post_id])
  end
end
