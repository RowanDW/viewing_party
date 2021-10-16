class MoviesController < ApplicationController
  def index
    if params[:query]
      @movies = MovieFacade.search(params[:query])
    else
      @movies = MovieFacade.top_movies
    end
  end

  def show
    @movie = MovieFacade.movie_show(params[:id])
  end
end
