class Movie
  attr_reader :title,
                :vote_average,
                :runtime,
                :genres,
                :overview,
                :cast,
                :reviews

  def initialize(attributes)
    @title       = attributes[:title]
    @vote_average       = attributes[:vote_average]
    @runtime      = attributes[:runtime]
    @genres   = format_genres(attributes[:genres])
    @overview   = attributes[:overview]
    @cast
    @reviews
  end

  def format_genres(data)
    genres = data.map do |genre|
      genre[:name]
    end
  end

  def add_cast(data)
    cast = data[:cast].map do |actor|
      {actor: actor[:name], character: actor[:character]}
    end
    @cast = cast.slice(0, 10)
  end

  def add_reviews(data)
    reviews = data[:results].map do |rev|
      {author: rev[:author], content: rev[:content]}
    end
    @reviews = reviews
  end
end
