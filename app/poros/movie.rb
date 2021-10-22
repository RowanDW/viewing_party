class Movie
  attr_reader :id,
              :title,
              :vote_average,
              :runtime,
              :genres,
              :overview,
              :cast,
              :reviews

  def initialize(details, cast_info, rev_info)
    @id             = details[:id]
    @title          = details[:title]
    @overview       = details[:overview]
    @vote_average   = details[:vote_average]
    @runtime        = details[:runtime]
    @genres         = get_genres(details[:genres])
    @cast           = get_cast(cast_info[:cast])
    @reviews        = get_reviews(rev_info[:results])
  end

  def get_genres(data)
    data.map {|genre| genre[:name]}
  end

  def get_cast(data)
    data[0..9].map { |actor| Actor.new(actor) }
  end

  def get_reviews(data)
    data.map { |review|  Review.new(review) }
  end
end
