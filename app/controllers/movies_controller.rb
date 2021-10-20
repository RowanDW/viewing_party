class MoviesController < ApplicationController
  def index
    @movies = MovieFacade.top_forty
    @movies = MovieFacade.search_title(params[:query]) if params[:query]
  end

  def show
    @movie = MovieFacade.movie_show(params[:id])
  end
end
