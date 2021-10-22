class MovieFacade
  def self.movie_show(movie_id)
    details = MovieService.details(movie_id)
    cast = MovieService.cast(movie_id)
    reviews = MovieService.reviews(movie_id)
    @movie = Movie.new(details, cast, reviews)
    # require "pry"; binding.pry 

  end

  def self.top_forty
    pg1 = MovieService.top_forty(1)
    pg2 = MovieService.top_forty(2)
    pg1.concat(pg2)
  end

  def self.search_title(query)
    query.gsub!(' ', '+')
    movies = MovieService.search_title(query)
    movies
  end

  def self.now_playing
    MovieService.now_playing
    # movies = MovieService.now_playing
    # movies
  end

  def self.recommended(movie_id)
    movies = MovieService.recommended(movie_id)
    movies
  end
end
