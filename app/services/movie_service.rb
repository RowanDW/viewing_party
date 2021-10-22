class MovieService
  def self.recommended(movie_id)
    request("/3/movie/#{movie_id}/recommendations")
  end

  def self.search_title(query)
    request("/3/search/movie?query=#{query}")
  end

  def self.details(movie_id)
    # request("/3/movie/#{movie_id}")
    response = conn.get("/3/movie/#{movie_id}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.cast(movie_id)
    # request("/3/movie/#{movie_id}/credits")
    response = conn.get("/3/movie/#{movie_id}/credits")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.reviews(movie_id)
    # request("/3/movie/#{movie_id}/reviews")
    response = conn.get("/3/movie/#{movie_id}/reviews")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.top_forty(page)
    request("/3/discover/movie?page=#{page}")
  end

  def self.now_playing
    request('/3/movie/now_playing')
  end

  private
  def self.request(path)
    response = conn.get(path)
    JSON.parse(response.body, symbolize_names: true)[:results]
  end

  def self.conn
    # Faraday.new(url: 'https://api.themoviedb.org/', params: { api_key: ENV['tmdb_api_key'] }) do |faraday|
    Faraday.new(url: 'https://api.themoviedb.org/') do |faraday|
      faraday.params['api_key'] = ENV["tmdb_api_key"]
      # faraday.adapter Faraday.default_adapter
    end
  end
end
