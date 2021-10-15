class MoviesController < ApplicationController
  def index

  end

  def show
    @movie = MovieFacade.movie_show(params[:id])
  end
end
