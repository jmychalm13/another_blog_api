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
end
