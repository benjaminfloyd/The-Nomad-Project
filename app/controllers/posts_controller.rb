class PostsController < ApplicationController
  before_action :authenticate_user!, :except => [:show, :index]
  load_and_authorize_resource  only: [:edit, :update, :destroy]

  before_action :default_post_img, :only => [:create, :update]
  def index
    @city = City.friendly.find(params[:city_id])
    redirect_to city_path(@city)
  end

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
    
    respond_to do |format|
      if @post.save
        format.html { redirect_to city_post_path(@city, @post), notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
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
   
   respond_to do |format|
      if @post.save
        format.html { redirect_to city_post_path(@city, @post), notice: 'Post was successfully updated.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @city = City.find(params[:city_id])
    @post = @city.posts.find(params[:id])
    if @post.destroy
    redirect_to city_path(@city), notice: "Comment Removed"
  else
    redirect_to city_path(@city), error: "We could not remove the comment"
  end
  end

private
  def post_params
    params.require(:post).permit(:title, :post, :img).merge(user_id: current_user.id, city_id:params[:city_id])
  end

  def default_post_img
    if params[:post][:photo] == ''
      params[:post][:photo] = 'https://cdn.pixabay.com/photo/2016/01/19/15/48/luggage-1149289_960_720.jpg'
  end
  end

end