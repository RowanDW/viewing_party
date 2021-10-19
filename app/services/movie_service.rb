class MovieService
  def self.search_title(query)
    response = conn.get("/3/search/movie?query=#{query}")
    parse_json(response)
  end

  def self.details(movie_id)
    response = conn.get("/3/movie/#{movie_id}")
    parse_json(response)
  end

  def self.cast(movie_id)
    response = conn.get("/3/movie/#{movie_id}/credits")
    parse_json(response)
  end

  def self.reviews(movie_id)
    response = conn.get("/3/movie/#{movie_id}/reviews")
    parse_json(response)
  end

  def self.top_forty(page)
    response = conn.get("/3/discover/movie?page=#{page}")
    parse_json(response)
  end


  private
  def self.conn
    # Faraday.new(url: 'https://api.themoviedb.org/') do |faraday|
    #   faraday.headers["api_key"] = ENV['tmdb_api_key']
    Faraday.new(url: 'https://api.themoviedb.org/', params: {api_key: ENV['tmdb_api_key']}) do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end

  def self.parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
