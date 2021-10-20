class MovieFacade
  def self.get_details
    movie_info = MovieService.list_details
    # movie_id = movie_info[:id]
    # title = movie_info[:title]
    Movie.new(movie_info)
  end

  def self.search_titles(title)
    found_movies = MovieService.search_for(title)
    # require "pry"; binding.pry
    found_movies[:results]
  end

end
