class MovieFacade
  def self.movie_show(id)
    info = MovieService.request("/3/movie/#{id}")
    cast = MovieService.request("/3/movie/#{id}/credits")
    reviews = MovieService.request("/3/movie/#{id}/reviews")
    @movie = Movie.new(info, cast, reviews)
  end

  def self.top_forty
    MovieService.top_forty(1) + MovieService.top_forty(2)
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
