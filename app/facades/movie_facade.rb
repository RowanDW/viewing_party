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

  def self.top_movies
    pg1 = MovieService.top_movies(1)
    pg2 = MovieService.top_movies(2)
    movies = pg1[:results].concat(pg2[:results])
  end

  def self.search(query)
    query.gsub!(" ", "+")
    movies = MovieService.search(query)
    movies[:results]
  end
end
