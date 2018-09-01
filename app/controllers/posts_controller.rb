class PostsController < ApplicationController
  before_filter :authorize
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
    @post  = Post.new
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
    respond_to do |format|
      format.js {render "posts/update"}
    end
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.interactions.build(post_id: @post.id, user_id: session[:user]['id'], like: 0, share: 0, comment: 0)

    respond_to do |format|
      if @post.save
        format.js
        flash[:notice] = "Post, which Id is #{@post.id} was successfully created."
      else
        format.js
        @post.errors.each do |key, value|
        end
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.jsonpo
  def update
    respond_to do |format|po
      if @post.update(post_params)
        format.js { @post }
        flash[:notice] = "Post, which Id is #{@post.id} was successfully updated."
      else
        format.js
        @post.errors.each do |key, value|
        end
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
      format.js   { render layout: false}
    end
  end

  def add_favorite
    post = Post.find(params[:post_id])
    post.interactions.each do |itr|
      like = itr.like + 1
      post.interactions.update(like: like)
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :content)
    end
end
