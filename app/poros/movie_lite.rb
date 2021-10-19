class MovieLite
  attr_reader :id,
              :title,
              :vote_average,
              :poster

  def initialize(main_attributes)
    @id             = main_attributes[:id]
    @title          = main_attributes[:title]
    @vote_average   = main_attributes[:vote_average]
    @poster         = add_base_url(main_attributes[:poster_path])
  end

  def add_base_url(path)
    "https://image.tmdb.org/t/p/w342#{path}"
  end
end
