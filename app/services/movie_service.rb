class MovieService
  def self.movie_details(movie_id)
    response = conn.get("/3/movie/#{movie_id}")
    movie_details = JSON.parse(response.body, symbolize_names: true)
  end

  def self.movie_cast(movie_id)
    response = conn.get("/3/movie/#{movie_id}/credits")
    movie_cast = JSON.parse(response.body, symbolize_names: true)
  end

  def self.movie_reviews(movie_id)
    response = conn.get("/3/movie/#{movie_id}/reviews")
    movie_reviews = JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: 'https://api.themoviedb.org/', params: {api_key: ENV['tmdb_api_key']}) do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end
end
