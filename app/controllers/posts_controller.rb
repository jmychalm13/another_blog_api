class PostsController < ApplicationController
  def index
    @posts = Post.all()
    render :index
  end

  def create
    @post = Post.create(
      title: params[:title],
      content: params[:content],
      user_id: current_user.id
    )

    if @post.valid?
      render :show
    else
      render json: {errors: @post.errors.full_messages}, status: 422
    end
  end


  def show
    @post = Post.find_by(id: params[:id])
    render :show
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.update(
      title: params[:name] || @post.name,
      content: params[:content] || @post.content,
    )
    render :show
  end
end
