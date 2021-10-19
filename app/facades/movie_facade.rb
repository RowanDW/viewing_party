class MovieFacade
  def self.movie_show(movie_id)
    details = MovieService.details(movie_id)
    cast = MovieService.cast(movie_id)
    reviews = MovieService.reviews(movie_id)
    @movie = Movie.new(details, cast, reviews)
  end

  def self.top_forty
    pg1 = MovieService.top_forty(1)
    pg2 = MovieService.top_forty(2)
    pg1[:results].concat(pg2[:results])
  end

  def self.search_title(query)
    query.gsub!(' ', '+')
    movies = MovieService.search_title(query)
    movies[:results]
  end
end
