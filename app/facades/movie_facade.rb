class MovieFacade
  def self.movie_search(title)
    data = MovieService.movie_details

    details = data[:results]
  end

end
