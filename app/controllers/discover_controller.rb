class DiscoverController < ApplicationController
  def index
    @search_movies = Movie.search(params[:query]) if params[:query]
  end
end
