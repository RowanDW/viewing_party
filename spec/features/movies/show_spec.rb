require 'rails_helper'

RSpec.describe "The movie show page" do
  it "text" do
    visit movie_path(75780)
  end
end
