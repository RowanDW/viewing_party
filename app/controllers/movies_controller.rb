class MoviesController < ApplicationController
  def index
    @movie = MovieFacade.movie_search(params[:query])
  end


end
