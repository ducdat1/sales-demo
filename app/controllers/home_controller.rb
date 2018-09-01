class HomeController < ApplicationController
  def index
    @products = Product.all
  end
  def post_display
    @posts = Post.includes(:users).all
    render "home/post"
  end
end
