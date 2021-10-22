require 'rails_helper'

RSpec.describe Actor do
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

    cast_attrs =  {
      "cast": [
          {"name": "Vin Diesel", "character": "Dominic Toretto"},
          {"name": "Michelle Rodriguez","character": "Letty Ortiz"}
       ]
    }

    review_attrs = {
      "results": [
        {author: "Anon1", content: "Meh"},
        {author: "Anon2", content: "Amazing"}
      ]
    }
    @movie = Movie.new(main_attrs, cast_attrs, review_attrs)
  end

  it "exists and has attributes" do

    cast_results = [
        {"actor": "Vin Diesel", "character": "Dominic Toretto"},
        {"actor": "Michelle Rodriguez","character": "Letty Ortiz"}
     ]

    expect(@movie.cast).to be_an Array
    expect(@movie.cast.count).to eq(2)

    first_result = @movie.cast.first

    expect(first_result).to be_an Actor
    expect(first_result.name).to eq(cast_results.first[:actor])
    expect(first_result.character).to eq(cast_results.first[:character])
  end
end
