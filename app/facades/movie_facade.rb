class MovieFacade
  def self.movie_show(id)
    details = MovieService.details(id)
    cast = MovieService.cast(id)
    reviews = MovieService.reviews(id)
    @movie = Movie.new(details, cast, reviews)
  end

  def self.top_forty
    pg1 = MovieService.top_forty(1)
    pg2 = MovieService.top_forty(2)
    pg1 + pg2
  end

  def self.search_title(query)
    query.gsub!(' ', '+')
    MovieService.search_title(query)
  end

  def self.now_playing
    MovieService.now_playing
  end

  def self.recommended(id)
    MovieService.recommended(id)
  end
end
