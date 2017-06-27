class PostsController < ApplicationController
	def index
    @post = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @city = Film.new
 end

  def create
    @post = Post.create!(post_params)
      redirect_to "/posts/#{@post.id}"
  end

#   def edit
#      @film = Film.find(params[:id])
#   end

#   def update
#    @film = Film.find(params[:id])
#    @film.update(film_params)
#    redirect_to "/films/#{@film.id}"
#   end
  
#   def delete
#     @film = Film.find(params[:id])
#     @film.destroy

#     redirect_to "/films"
#   end

end
