class MovieService
  # class << self; end
  def self.conn
    Faraday.new(url: "https://api.themoviedb.org", params: {"api_key" => ENV['tmdb_api_key']}, headers: {'Content-Type' => 'application/json'}) do |faraday|
    end
  end

  def self.list_details(movie_id)
    response = conn.get("/3/movie/#{movie_id}")

    JSON.parse(response.body, symbolize_names: true)
    # require "pry"; binding.pry
  end

  def self.search_for(title)
    response = conn.get("/3/search/movie?query=#{title}")

    JSON.parse(response.body, symbolize_names: true)
  end

end
