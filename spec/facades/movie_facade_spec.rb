require 'rails_helper'

RSpec.describe 'MovieFacade' do
  describe 'class methods' do
    describe '::top_forty' do
      it 'returns list of top forty movies', :vcr do
        movies = MovieFacade.top_forty

        expect(movies).to be_a(Array)
        expect(movies.count).to eq(40)
        expect(movies.first[:title]).to eq("Venom: Let There Be Carnage")
      end
    end

    describe '::now_playing' do
      it 'returns list of movies now playing', :vcr do
        movies = MovieFacade.now_playing

        expect(movies).to be_a(Array)
        expect(movies.count).to eq(20)
        expect(movies.second[:title]).to eq("Free Guy")
      end
    end

    describe '::recommended' do
      it 'returns list of recommended movies', :vcr do
        movies = MovieFacade.recommended(451048)

        expect(movies).to be_a(Array)
        expect(movies.count).to eq(21)
        expect(movies.second[:title]).to eq("F9")
      end
    end

    describe '::search_title' do
      it 'returns all movies related to query', :vcr do
        movies = MovieFacade.search_title("Cruella")

        expect(movies).to be_a(Array)
        expect(movies.count).to eq(5)
        expect(movies.first[:title]).to eq("Cruella")
      end
    end

    describe '::movie_show' do
      it 'returns all movies and details', :vcr do
        movie = MovieFacade.movie_show(337404)

        expect(movie).to be_a(Movie)
      end
    end
  end
end
