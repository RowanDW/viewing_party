class MoviesController < ApplicationController
  def index
    @movie = MovieFacade.search_title(params[:query])
  end


end
