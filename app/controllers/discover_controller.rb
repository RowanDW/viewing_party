class DiscoverController < ApplicationController
  def index
    # if params[:query]
    #   @application = Application.find(params[:id])
    #   @pets = Pet.search(params[:query])
    #   # binding.pry
    # else
    #   @application = Application.find(params[:id])
    # end
    @search_movies = Movie.search(params[:query]) if params[:query]
  end
end
