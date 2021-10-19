class MovieFacade
  def self.movie_search(title)
    data = MovieService.search_title(title)
  require "pry"; binding.pry
    details = data[:results]
  end

end
