require 'rails_helper'

RSpec.describe Review do
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

    rev_results = [
      {author: "Anon1", content: "Meh"},
      {author: "Anon2", content: "Amazing"}
    ]

    expect(@movie.reviews).to be_an Array
    expect(@movie.reviews.count).to eq(2)

    first_result = @movie.reviews.first

    expect(first_result).to be_a Review
    expect(first_result.author).to eq(rev_results.first[:author])
    expect(first_result.content).to eq(rev_results.first[:content])
  end
end
