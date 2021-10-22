class Movie
  attr_reader :id,
              :title,
              :vote_average,
              :runtime,
              :genres,
              :overview,
              :cast,
              :reviews

  def initialize(main_info, cast_info, rev_info)
    @id             = main_info[:id]
    @title          = main_info[:title]
    @overview       = main_info[:overview]
    @vote_average   = main_info[:vote_average]
    @runtime        = main_info[:runtime]
    @genres         = get_genres(main_info[:genres])
    @cast           = get_cast(cast_info[:cast])
    @reviews        = get_reviews(rev_info[:results])
  end

  def get_genres(data)
    data.map { |genre| genre[:name] }
  end

  def get_cast(data)
    data[0..9].map { |actor| Actor.new(actor) }
  end

  def get_reviews(data)
    data.map { |review| Review.new(review) }
  end
end
