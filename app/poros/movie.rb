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


  def initialize(main_info, cast_info, rev_info)
    @id             = main_info[:id]
    @title          = main_info[:title]
    @vote_average   = main_info[:vote_average]
    @runtime        = main_info[:runtime]
    @genres         = format_genres(main_info[:genres])
    @overview       = main_info[:overview]
    @cast           = format_cast(cast_info[:cast])
    @reviews        = format_reviews(rev_info[:results])
    # @poster         = add_base_url(main_info[:poster_path])
  end

  def format_genres(data)
    genres = data.map do |genre|
      genre[:name]
    end
  end

  def format_cast(data)
    cast = data.map do |actor|
      {actor: actor[:name], character: actor[:character]}
    end
    cast = cast.slice(0, 10)
  end

  def format_reviews(data)
    reviews = data.map do |rev|
      {author: rev[:author], content: rev[:content]}
    end
  end

  # def add_base_url(path)
  #   "https://image.tmdb.org/t/p/w342/" + path
  # end
end
