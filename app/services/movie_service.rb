class MovieService
  def self.search_title(title)
    conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.headers["api_key"] = ENV[tmdb_api_key]
      faraday.adapter Faraday.default_adapter
    end

    response = conn.get("/3/movie/{movies_id}")
    json = JSON.parse(response.body, symbolize_names: true)
  end

  private
  def self.conn
    Faraday.new(url: 'https://api.themoviedb.org/') do |faraday|
      # , params: {api_key: ENV['tmdb_api_key']}
      faraday.headers["api_key"] = ENV[tmdb_api_key]
      faraday.adapter Faraday.default_adapter
    end
  end

  def self.parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
