class Api::PostsController < ApplicationController

  before_action do
    request.format = :json

  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find params[:id]
  end

  def new
    @post =  Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      render status: 201, json: @post
    else
      render status: 422, json: @post.errors
    end
  end

  def edit
    @post = Post.find params[:id]
  end

   def update
     @post = Post.find params[:id]
      if @post.save
        render status: 201, json: @post
      else
        render status: 422, json: @post.errors
     end
    end

  def delete
    @post = Post.find params[:id]
    @post.destroy
    render status: 201, json: {posts: @posts}

  end

  def post_params
    params.require(:post).permit(:title)
  end

end
