class MovieService
  def self.recommended(movie_id)
    response = conn.get("/3/movie/#{movie_id}/recommendations")
    parse_json(response)
  end

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

  def self.now_playing
    response = conn.get('/3/movie/now_playing')
    parse_json(response)
  end

  private
  def self.request(path)
    response = conn.get(path)
    JSON.parse(response.body, symbolize_names: true)[:results]
  end

  def self.conn
    Faraday.new(url: 'https://api.themoviedb.org/', params: { api_key: ENV['tmdb_api_key'] }) do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end

  def self.parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
