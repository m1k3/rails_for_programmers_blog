class Posts::CommentsController < ApplicationController
  before_action :set_post
  before_action :set_comment, only: [:edit, :update]
  before_action :authenticate_user!

  def create
    @comment = @post.comments.build(comment_params.merge(user: current_user))

    if @comment.save
      flash[:notice] = 'Comment added.'
    else
      flash[:notice] = 'There is something wrong. Please check your comment.'
    end
    redirect_to @post
  end

  def edit
  end

  def update
    if @comment.update_attributes comment_params
      flash[:notice] = 'Comment updated.'
    else
      flash[:notice] = 'There is something wrong. Please check your comment.'
    end

    redirect_to @post
  end

  private
    def set_comment
      @comment = @post.comments.find(params[:id])
    end

    def set_post
      @post = current_user.posts.find(params[:post_id])
    end

    def comment_params
      params.require(:comment).permit(:body)
    end
end
