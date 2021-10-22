require 'rails_helper'

RSpec.describe Review do
  it "exists and has attributes", :vcr do
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
        author: "garethmb",
        content: "After being delayed from a summer 2020 release by the Pandemic; Universal has released the latest film in the Fast and The Furious franchise to fans eager for some adrenaline-fueled summer action. “F9 The Fast Saga” has done well in the few countries it has already been released, and has raced to a nearly $300 million total which the industry hopes is a signal that people are ready to return to cinemas in numbers again and that the film will take off when it opens in the U.S. and other markets. The film opens with a flashback to the 1980s where young Dominic and his brother experience an event that changes their lives and drives a wedge between them. Moving forward to the present day, Dom (Vin Diesel) and Letty (Michelle Rodriguez), are living in seclusion with Dom’s son. When the crew shows up unexpectedly with a mission from Mr. Nobody (Kurt Russell); who has gone missing, the crew venture out to retrieve a missing device which in turn puts them directly in the path with nefarious individuals and a ghost from Dom’s past. As anyone who has watched any films in the series knows; the plots are often thin and a bit absurd as they serve simply as a device for the cast to assemble and chase a McGuffin to save the day. In doing so; the audience knows there will be an abundance of fists, bullets, cars, crashes, and outrageous stunts along the way. While reality and credibility are not words associated with the franchise, the cast eagerly plays along with the absurdity, action, and mayhem and gives fans what they want. While the middle portion dragged while the audience was given more of the setup and introduced to cast members old and new; the action sequences are the over-the-top show stoppers which have become a staple of the franchise. Director Justin Lin knows this and his return to the franchise does not attempt to invoke any new wrinkles and gives fans what they expect. The large ensemble works well with one another and John Cena is a very interesting addition to the cast. Audiences will want to make sure to stay seated for a bonus scene that sets up the next film or spin-off very well and opens up some very interesting possibilities. In the end “F9 The Fast Saga” gives audiences a dose of high-octane adrenaline and a return to no-brainer over the top action when it is needed the most. Check your brain at the door, strap in, and enjoy the ride. 3.5/5"
      },
      {
        author: "Peter89Spencer",
        content: "After being delayed from a summer 2020 release by the Pandemic; Universal has released the latest film in the Fast and The Furious franchise to fans eager for some adrenaline-fueled summer action. “F9 The Fast Saga” has done well in the few countries it has already been released, and has raced to a nearly $300 million total which the industry hopes is a signal that people are ready to return to cinemas in numbers again and that the film will take off when it opens in the U.S. and other markets. The film opens with a flashback to the 1980s where young Dominic and his brother experience an event that changes their lives and drives a wedge between them. Moving forward to the present day, Dom (Vin Diesel) and Letty (Michelle Rodriguez), are living in seclusion with Dom’s son. When the crew shows up unexpectedly with a mission from Mr. Nobody (Kurt Russell); who has gone missing, the crew venture out to retrieve a missing device which in turn puts them directly in the path with nefarious individuals and a ghost from Dom’s past. As anyone who has watched any films in the series knows; the plots are often thin and a bit absurd as they serve simply as a device for the cast to assemble and chase a McGuffin to save the day. In doing so; the audience knows there will be an abundance of fists, bullets, cars, crashes, and outrageous stunts along the way. While reality and credibility are not words associated with the franchise, the cast eagerly plays along with the absurdity, action, and mayhem and gives fans what they want. While the middle portion dragged while the audience was given more of the setup and introduced to cast members old and new; the action sequences are the over-the-top show stoppers which have become a staple of the franchise. Director Justin Lin knows this and his return to the franchise does not attempt to invoke any new wrinkles and gives fans what they expect. The large ensemble works well with one another and John Cena is a very interesting addition to the cast. Audiences will want to make sure to stay seated for a bonus scene that sets up the next film or spin-off very well and opens up some very interesting possibilities. In the end “F9 The Fast Saga” gives audiences a dose of high-octane adrenaline and a return to no-brainer over the top action when it is needed the most. Check your brain at the door, strap in, and enjoy the ride. 3.5/5"
      }
    ]

    response = MovieFacade.all_reviews(385128)

    expect(response).to be_an Array
    expect(response.count).to eq(8)

    object = response.second

    expect(object).to be_a Review
    expect(object.author).to eq(results.first[:author])
    # expect(object.content).to eq(results.first[:content])
  end
end
