require 'rails_helper'

RSpec.describe Movie do
  before :each do
    main_attrs = {
      "genres": [
        {"id": 28, "name": "Action"},
        {"id": 80, "name": "Crime"},
        {"id": 53, "name": "Thriller"}
      ],
      "id": 385128,
      "overview": "Cars go fast and explode",
      "runtime": 143,
      "title": "F9",
      "vote_average": 7.4
    }

    @movie = Movie.new(main_attrs)
  end

  it "exists and has attributes" do
    expect(@movie).to be_a Movie
    expect(@movie.id).to eq(385128)
    expect(@movie.title).to eq("F9")
    expect(@movie.vote_average).to eq(7.4)
    expect(@movie.runtime).to eq(143)
    expect(@movie.genres).to eq(["Action", "Crime", "Thriller"])
    expect(@movie.overview).to eq("Cars go fast and explode")
  end


  it ".get_genres" do
    genres = {"genres": [
      {id: 28, name: "Action"},
      {id: 80, name: "Crime"},
      {id: 53, name: "Thriller"}
    ]}
    expect(@movie.get_genres(genres[:genres])).to eq(["Action", "Crime", "Thriller"])
  end
end
