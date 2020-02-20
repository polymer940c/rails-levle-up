class PostsController < ApplicationController
  def index
  end
  def new
    @post = Post.new
  end
  def create
    @post = Post.new(post_params)
    if @post.save
      # fine go to show
      redirect_to @post
    else
      # gtfo
      render 'new'
    end

  end
  private
  def post_params
    params.require(:post).permit(:body,:subject)
  end
end
