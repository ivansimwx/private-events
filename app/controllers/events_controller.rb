class EventsController < ApplicationController
  # before_action :authenticate_user!, only: [ :new, :create ]

  # def new
  #   @post = Post.new
  # end

  # def create
  #   @post = current_user.posts.build(post_params)
  #   if @post.save
  #     redirect_to posts_path, notice: 'Post was successfully created.'
  #   else
  #     render :new, status: :unprocessable_entity
  #   end
  # end

  def index
    @events = Event.all
  end

  # private
  # def post_params
  #   params.require(:post).permit(:title, :body)
  # end
end
