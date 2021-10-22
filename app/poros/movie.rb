class Movie
  attr_reader :id,
              :title,
              :vote_average,
              :runtime,
              :genres,
              :overview

  def initialize(main_info)
    @id             = main_info[:id]
    @title          = main_info[:title]
    @overview       = main_info[:overview]
    @vote_average   = main_info[:vote_average]
    @runtime        = main_info[:runtime]
    @genres         = get_genres(main_info[:genres])
  end

  def get_genres(data)
    data.map { |genre| genre[:name] }
  end
end
