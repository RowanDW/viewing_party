require 'rails_helper'

RSpec.describe MovieService do
  before(:each) do
    @m = MovieService.new
  end

  it 'exists' do
    expect(@m).to be_a(MovieService)
  end

  describe 'instance methods' do
    describe '#top_forty' do
     xit 'can find the top forty movies' do
        # VCR.use_cassette("tmbd_upcoming_movies") do
        # require "pry"; binding.pry

          response = @m.top_forty(1)

          expect(response).to have_key(:results)
          expect(response).to have_key(:page)
          expect(response[:results]).to be_an(Array)
        # end
      end
    end
  end
end
