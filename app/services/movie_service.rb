class MovieService
  def self.movie_details(movie_id)
    response = conn.get("/3/movie/#{movie_id}")
    parse_json(response)
  end

  def self.movie_cast(movie_id)
    response = conn.get("/3/movie/#{movie_id}/credits")
    parse_json(response)
  end

  def self.movie_reviews(movie_id)
    response = conn.get("/3/movie/#{movie_id}/reviews")
    parse_json(response)
  end

  def self.top_movies(page)
    response = conn.get("/3/discover/movie?page=#{page}")
    parse_json(response)
  end

  def self.search(query)
    response = conn.get("/3/search/movie?query=#{query}")
    parse_json(response)
  end

  def self.conn
    Faraday.new(url: 'https://api.themoviedb.org/', params: {api_key: ENV['tmdb_api_key']}) do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end

  def self.parse_json(response)
      JSON.parse(response.body, symbolize_names: true)
    end
end
