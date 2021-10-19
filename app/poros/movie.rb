class Movie
  attr_reader :id,
              :title,
              :vote_average,
              :runtime,
              :genres,
              :overview,
              :cast,
              :reviews,
              :poster

  def initialize(main_attributes, cast_attributes, rev_attributes)
    @id             = main_attributes[:id]
    @title          = main_attributes[:title]
    @vote_average   = main_attributes[:vote_average]
    @runtime        = main_attributes[:runtime]
    @genres         = format_genres(main_attributes[:genres])
    @overview       = main_attributes[:overview]
    @cast           = format_cast(cast_attributes[:cast])
    @reviews        = format_reviews(rev_attributes[:results])
    @poster         = add_base_url(main_attributes[:poster_path])
  end

  def format_genres(data)
    data.map do |genre|
      genre[:name]
    end
  end

  def format_cast(data)
    cast = data.map do |actor|
      { actor: actor[:name], character: actor[:character] }
    end
    cast.slice(0, 10)
  end

  def format_reviews(data)
    data.map do |rev|
      { author: rev[:author], content: rev[:content] }
    end
  end

  def add_base_url(path)
    "https://image.tmdb.org/t/p/w342/#{path}"
  end
end
