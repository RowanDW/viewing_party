require 'rails_helper'

RSpec.describe MovieLite do
  before :each do
    attrs = File.read("spec/fixtures/movie_details.json")
    @main_attrs = JSON.parse(attrs, symbolize_names: true)

    @movie = MovieLite.new(@main_attrs)
  end

  it "exists and has attributes" do
    expect(@movie).to be_a MovieLite
    expect(@movie.id).to eq(385128)
    expect(@movie.title).to eq("F9")
    expect(@movie.vote_average).to eq(7.4)
    expect(@movie.poster).to eq("https://image.tmdb.org/t/p/w342/bOFaAXmWWXC3Rbv4u4uM9ZSzRXP.jpg")
  end

  it ".add-add_base_url" do
    expect(@movie.add_base_url(@main_attrs[:poster_path])).to eq("https://image.tmdb.org/t/p/w342/bOFaAXmWWXC3Rbv4u4uM9ZSzRXP.jpg")
  end
end
