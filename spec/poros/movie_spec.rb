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

    rev_results = [
      {author: "Anon1", content: "Meh"},
      {author: "Anon2", content: "Amazing"}
    ]

    expect(@movie).to be_a Movie
    expect(@movie.id).to eq(385128)
    expect(@movie.title).to eq("F9")
    expect(@movie.vote_average).to eq(7.4)
    expect(@movie.runtime).to eq(143)
    expect(@movie.genres).to eq(["Action", "Crime", "Thriller"])
    expect(@movie.overview).to eq("Cars go fast and explode")
    expect(@movie.cast).to eq(cast_results)
    expect(@movie.reviews).to eq(rev_results)
  end


  it ".format_genres" do
    genres = {"genres": [
      {id: 28, name: "Action"},
      {id: 80, name: "Crime"},
      {id: 53, name: "Thriller"}
    ]}
    expect(@movie.format_genres(genres[:genres])).to eq(["Action", "Crime", "Thriller"])
  end

  it ".format_cast" do
    cast = {
      "id": 385128,
      "cast": [
          {
              "adult": false,
              "gender": 2,
              "id": 12835,
              "known_for_department": "Acting",
              "name": "Vin Diesel",
              "original_name": "Vin Diesel",
              "popularity": 25.563,
              "profile_path": "/9uxTwqB8anAiPomB6Kqm6A73VTV.jpg",
              "cast_id": 0,
              "character": "Dominic Toretto",
              "credit_id": "58433f95c3a3684813001d9f",
              "order": 0
          },
          {
              "adult": false,
              "gender": 1,
              "id": 17647,
              "known_for_department": "Acting",
              "name": "Michelle Rodriguez",
              "original_name": "Michelle Rodriguez",
              "popularity": 12.319,
              "profile_path": "/hulQAiXNFLq4VDYVxBPgK009njf.jpg",
              "cast_id": 19,
              "character": "Letty Ortiz",
              "credit_id": "5d11ce8092514131e9ba6ace",
              "order": 1
          },
          {
              "adult": false,
              "gender": 2,
              "id": 8169,
              "known_for_department": "Acting",
              "name": "Tyrese Gibson",
              "original_name": "Tyrese Gibson",
              "popularity": 10.199,
              "profile_path": "/jxoy4fbXNKFQtBdK73cLXEz3ufS.jpg",
              "cast_id": 1,
              "character": "Roman Pearce",
              "credit_id": "58433fb5c3a3684813001db8",
              "order": 2
          },
          {
              "adult": false,
              "gender": 2,
              "id": 8171,
              "known_for_department": "Acting",
              "name": "Ludacris",
              "original_name": "Ludacris",
              "popularity": 9.255,
              "profile_path": "/erkJijujhe48vhJ8iCEtVpNEeVn.jpg",
              "cast_id": 37,
              "character": "Tej Parker",
              "credit_id": "5d82ada4869e75001e0c385e",
              "order": 3
          },
          {
              "adult": false,
              "gender": 2,
              "id": 56446,
              "known_for_department": "Acting",
              "name": "John Cena",
              "original_name": "John Cena",
              "popularity": 11.251,
              "profile_path": "/rgB2eIOt7WyQjdgJCOuESdDlrjg.jpg",
              "cast_id": 22,
              "character": "Jakob Toretto",
              "credit_id": "5d11cebd0e0a26641aca2468",
              "order": 4
          },
          {
              "adult": false,
              "gender": 1,
              "id": 1251069,
              "known_for_department": "Acting",
              "name": "Nathalie Emmanuel",
              "original_name": "Nathalie Emmanuel",
              "popularity": 6.903,
              "profile_path": "/bZT5ETfTk30w4XeXOyN8a0FrPPx.jpg",
              "cast_id": 34,
              "character": "Ramsey",
              "credit_id": "5d4999d8028f143e5c006133",
              "order": 5
          },
          {
              "adult": false,
              "gender": 1,
              "id": 22123,
              "known_for_department": "Acting",
              "name": "Jordana Brewster",
              "original_name": "Jordana Brewster",
              "popularity": 13.139,
              "profile_path": "/8VzFsSfT7NnMGyH5JQBQdTxDHcO.jpg",
              "cast_id": 20,
              "character": "Mia Toretto",
              "credit_id": "5d11ce8fc3a36809b220eb68",
              "order": 6
          },
          {
              "adult": false,
              "gender": 2,
              "id": 61697,
              "known_for_department": "Acting",
              "name": "Sung Kang",
              "original_name": "Sung Kang",
              "popularity": 11.031,
              "profile_path": "/wfuUkOZWuhkgfaA0Y3uMlQx0PXe.jpg",
              "cast_id": 46,
              "character": "Han Lue",
              "credit_id": "5e34a1554ca67600175067ef",
              "order": 7
          },
          {
              "adult": false,
              "gender": 2,
              "id": 12132,
              "known_for_department": "Acting",
              "name": "Michael Rooker",
              "original_name": "Michael Rooker",
              "popularity": 12.241,
              "profile_path": "/dq3xFKDWJsQjPffm1bmB3TbMilq.jpg",
              "cast_id": 35,
              "character": "Buddy",
              "credit_id": "5d5b496b60c75169a18d2c7b",
              "order": 8
          },
          {
              "adult": false,
              "gender": 1,
              "id": 15735,
              "known_for_department": "Acting",
              "name": "Helen Mirren",
              "original_name": "Helen Mirren",
              "popularity": 8.314,
              "profile_path": "/1reKRrsdsHXJaRVHVyOEg4oPTcZ.jpg",
              "cast_id": 33,
              "character": "Magdalene 'Queenie' Shaw",
              "credit_id": "5d49996a2d1e406fa1bfad02",
              "order": 9
          },
          {
              "adult": false,
              "gender": 2,
              "id": 6856,
              "known_for_department": "Acting",
              "name": "Kurt Russell",
              "original_name": "Kurt Russell",
              "popularity": 11.637,
              "profile_path": "/6g1d98oH4miG4k0ZiZWmF3Dt0bO.jpg",
              "cast_id": 67,
              "character": "Mr. Nobody",
              "credit_id": "60a39c85764b9900779f010c",
              "order": 10
          }
      ]
    }

    results = [
      {actor: "Vin Diesel", character: "Dominic Toretto"},
      {actor: "Michelle Rodriguez", character: "Letty Ortiz"},
      {actor: "Tyrese Gibson", character: "Roman Pearce"},
      {actor: "Ludacris", character: "Tej Parker"},
      {actor: "John Cena", character: "Jakob Toretto"},
      {actor: "Nathalie Emmanuel", character: "Ramsey"},
      {actor: "Jordana Brewster", character: "Mia Toretto"},
      {actor: "Sung Kang", character: "Han Lue"},
      {actor: "Michael Rooker", character: "Buddy"},
      {actor: "Helen Mirren", character: "Magdalene 'Queenie' Shaw"}
    ]
    # Only add first 10
    expect(@movie.format_cast(cast[:cast])).to eq(results)
  end

  it ".add_reviews" do
    reviews = {
      "id": 385128,
      "page": 1,
      "results": [
          {
              "author": "Mahnoor Khan",
              "author_details": {
                  "name": "Mahnoor Khan",
                  "username": "Mahnoor_Khan",
                  "avatar_path": "/wER6MfaKV3swJdjrvRHXwBQxBIw.png",
                  "rating": 4.0
              },
              "content": "I watched the film, but it didn't appeal to me as much as the prior films.\r\nThe change in theme and concept was one of the things that bothered me the most in this film.\r\n\r\nFrom street racing and minor crimes, the movies evolved into an idea of saving the planet. Okay, that's wonderful; you can save the world; however, how can someone reach space in his car and survive?\r\nSeriously? \r\n\r\nI don't recall this being fast and furious. The plot was similar to earlier films and revolved around Hobbs and Shaw. The story was not exceptional in any way.\r\n\r\nAnd, when it comes to action, it was unrealistic and unbelievable.\r\nThousands of cars followed Dom's crew, and thousands of guys with bullets and automatic weapons fired at them, but nothing happened to them. No one was hurt in any way. Are they immortals? \r\n\r\nI felt the absence of screenwriter Chris Morgan as the structure and storytelling were sloppier to the overall detriment of the film.",
              "created_at": "2021-08-04T09:13:20.328Z",
              "id": "610a5a305c5634007fe3b5b5",
              "updated_at": "2021-08-04T09:13:20.328Z",
              "url": "https://www.themoviedb.org/review/610a5a305c5634007fe3b5b5"
          },
          {
              "author": "echeng",
              "author_details": {
                  "name": "",
                  "username": "echeng",
                  "avatar_path": "/https://secure.gravatar.com/avatar/a45a699a3053cfdbcb97494eb2a6469c.jpg",
                  "rating": 4.0
              },
              "content": "Sure no one watches FF series expecting amazing plot, but surely it is now pushing the boundaries of ridiculous. I did enjoy the previous films just as silly action flicks but this one had me sighing in disbelief midway through.",
              "created_at": "2021-08-29T12:56:33.568Z",
              "id": "612b8401a4af8f008a2abe3e",
              "updated_at": "2021-09-09T17:17:50.083Z",
              "url": "https://www.themoviedb.org/review/612b8401a4af8f008a2abe3e"
          },
      ],
      "total_pages": 1,
      "total_results": 8
    }

    results = [
      {
        author: "Mahnoor Khan",
        content: "I watched the film, but it didn't appeal to me as much as the prior films.\r\nThe change in theme and concept was one of the things that bothered me the most in this film.\r\n\r\nFrom street racing and minor crimes, the movies evolved into an idea of saving the planet. Okay, that's wonderful; you can save the world; however, how can someone reach space in his car and survive?\r\nSeriously? \r\n\r\nI don't recall this being fast and furious. The plot was similar to earlier films and revolved around Hobbs and Shaw. The story was not exceptional in any way.\r\n\r\nAnd, when it comes to action, it was unrealistic and unbelievable.\r\nThousands of cars followed Dom's crew, and thousands of guys with bullets and automatic weapons fired at them, but nothing happened to them. No one was hurt in any way. Are they immortals? \r\n\r\nI felt the absence of screenwriter Chris Morgan as the structure and storytelling were sloppier to the overall detriment of the film."
      },
      {
        author: "echeng",
        content: "Sure no one watches FF series expecting amazing plot, but surely it is now pushing the boundaries of ridiculous. I did enjoy the previous films just as silly action flicks but this one had me sighing in disbelief midway through."
      }
    ]
    expect(@movie.format_reviews(reviews[:results])).to eq(results)
  end
end
