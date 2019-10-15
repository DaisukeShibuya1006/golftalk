class PostsController < ApplicationController

  def create
@post = Post.new(post_params)
end

private
  def new
    @post = Post.new
  end

def post_params
  params.require(:post).permit(:image)
end
end
