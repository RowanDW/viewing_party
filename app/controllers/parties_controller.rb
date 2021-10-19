class PartiesController < ApplicationController
  def new
    @movie = MovieFacade.movie_show(params[:id])
    @party = Party.new(duration: @movie.runtime)
  end

  def create; end
end
