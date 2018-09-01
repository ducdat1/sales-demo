class CommentsController < ApplicationController
  before_action :authorize, except: [:index]
  before_action :find_post!

  def index
    @comments = @post.comments.order(created_at: :desc)
  end

  def create
    @comment = @post.comments.new(comment_params)
    @comment.user = session[:user_id]['id']

    render json: { errors: @comment.errors }, status: :unprocessable_entity unless @comment.save
  end

  def destroy
    @comment = @post.comments.find(params[:id])

    if @comment.user_id == session[:user_id]['id']
      @comment.destroy
      render json: {}
    else
      render json: { errors: { comment: ['not owned by user'] } }, status: :forbidden
    end
  end

  private
    def find_post!
      @post = Post.find_by_id!(params[:post_id])
    end
    def comment_params
      params.require(:comment).permit(:body)
    end
end