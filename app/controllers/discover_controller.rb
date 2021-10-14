class DiscoverController < ApplicationController ##
  def index
    # if params[:query]
    #   @application = Application.find(params[:id])
    #   @pets = Pet.search(params[:query])
    #   # binding.pry
    # else
    #   @application = Application.find(params[:id])
    # end
    if params[:query]
      @search_movies = Movie.search(params[:query])
    end

  end
end
