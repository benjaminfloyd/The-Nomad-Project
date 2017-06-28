class PostsController < ApplicationController
	def index
    @post = Post.all
  end


  def new
    @city = City.find(params[:city_id])
    @post = Post.new
   end

  def create
    @city = City.find(params[:city_id])
    @post = Post.create(post_params)
      redirect_to city_path(@city)
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
     @city = City.find(params[:city_id])
     @post = Post.find(params[:id])
  end

  def update
   @city = City.find(params[:city_id])
   @post = Post.find(params[:id])
   @post.update(post_params)
   redirect_to city_path(@city)
  end
  
#   def delete
#     @film = Film.find(params[:id])
#     @film.destroy

#     redirect_to "/films"
#   end

private
  def post_params
    params.require(:post).permit(:title, :post, :img).merge(user_id: current_user.id, city_id:params[:city_id])
  end

end