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
    @vote_average   = main_info[:vote_average]
    @runtime        = main_info[:runtime]
    @genres         = list_genres(main_info[:genres])
    @overview       = main_info[:overview]
    @cast           = list_cast(cast_info[:cast])
    @reviews        = list_reviews(rev_info[:results])
  end

  def list_genres(data)
    genres = data.map do |genre|
      genre[:name]
    end
  end

  def list_cast(data)
    cast = data.map do |actor|
      {actor: actor[:name], character: actor[:character]}
    end
    cast = cast.slice(0, 10)
  end

  def list_reviews(data)
    reviews = data.map do |rev|
      {author: rev[:author], content: rev[:content]}
    end
  end

end
