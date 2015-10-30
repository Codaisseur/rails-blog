class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    if @post = Post.create(post_params)
      redirect_to @post, notice: "Post was created successfully"
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post, notice: "Post was updated successfully."
    else
      render :edit
    end
  end

  private

  # Clean up user input to make sure nothing illegal happens :)
  def post_params
    params.require(:post).permit(:id, :title, :body)
  end
end
