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
