class PostsController < ApplicationController


  def index
    @posts = Post.all
  end
  #show
  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end
  # new
  def new
    @post = Post.new
  end
  # edit
  def edit
    @post = Post.find(params[:id])
  end
  # create
  def create
    @post = Post.create!(post_params)
    redirect_to post_path(@post)
  end
  # update
  def update
    @post = Post.find(params[:id])
    @post.update(post_params)

    redirect_to post_path(@post)
  end
  # destroy
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:author, :title, :photo_url, :text)
  end
end
