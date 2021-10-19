require 'rails_helper'

RSpec.describe 'MovieFacade' do
  describe 'class methods' do
    describe '::top_forty' do
      xit 'returns list of top forty movies' do
        stub_top_forty
        movies = MovieFacade.top_forty

        expect(movies).to be_a(Array)
        expect(movies.count).to eq(40)
        expect(movies.first[:title]).to eq("Dilwale Dulhania Le Jayenge")
      end
    end

    describe '::search_title' do
      xit 'returns all movies related to query' do
        stub_search_by_title
        movies = MovieFacade.search_movie_title("Cruella")

        expect(movies).to be_a(Array)
        expect(movies.count).to eq(5)
        expect(movies.first[:title]).to eq("Cruella")
      end
    end

    describe '::movie_show' do
      xit 'returns all movies and details' do
        stub_movie_show
        movie = MovieFacade.movie_show(337404)

        expect(movie).to be_a(MovieDetails)
      end
    end
  end


end
