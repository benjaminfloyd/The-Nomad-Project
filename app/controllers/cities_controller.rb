class CitiesController < ApplicationController

  def index
    @cities = City.all
 
  end

  def show
    @city = City.find(params[:id])
  end

#   def new
#     @city = Film.new
#   end

#   def create
#     @city = Film.create!(city_params)
#       redirect_to "/films/#{@film.id}"
#   end

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

  private
  def city_params
    params.require(:city).permit(:name, :state, :image)
  end

end
