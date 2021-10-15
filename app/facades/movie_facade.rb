class MovieFacade

  def self.movie_show(movie_id)
    movie_details = MovieService.movie_details(movie_id)
    movie_cast = MovieService.movie_cast(movie_id)
    movie_reviews = MovieService.movie_reviews(movie_id)
    @movie = Movie.new(movie_details)
    @movie.add_cast(movie_cast)
    @movie.add_reviews(movie_reviews)
    @movie
  end
end
