class MoviesController < ApplicationController
  def index
    @movies = MovieFacade.top_forty # if params[:top_forty]
    @movies = MovieFacade.search_title(params[:query]) if params[:query]
    @movies = MovieFacade.now_playing if params[:now_playing]
  end

  def show
    @movie = MovieFacade.movie_show(params[:id])
    @cast = MovieFacade.all_cast(params[:id])
    @reviews = MovieFacade.all_reviews(params[:id])
    @recommendations = MovieFacade.recommended(params[:id])
    # require "pry"; binding.pry

  end
end
