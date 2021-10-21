require 'rails_helper'

RSpec.describe 'the discover-index page' do
  before :each do
    @rowan = User.create(name: 'Rowan', email: "rowan@test.com", password: "test")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@rowan)
  end

  it 'has button to go to movies now playing', :vcr do
    visit discover_path

    expect(page).to have_button("Movies Now Playing")
    click_button("Movies Now Playing")

    expect(current_path).to eq(movies_path)
    expect(page).to have_content("Free Guy")
  end

  it 'has button to go to top rated movies', :vcr do
    visit discover_path

    expect(page).to have_button("Find Top Rated Movies")
    click_button("Find Top Rated Movies")

    expect(current_path).to eq(movies_path)
    expect(page).to have_content("Venom: Let There Be Carnage")
  end

  it 'has a search field', :vcr do
    visit discover_path

    expect(page).to have_button("Find Movies")
    expect(page).to have_field(:query)

    fill_in :query, with: "Princess"
    click_on "Find Movies"

    expect(current_path).to eq(movies_path)
    expect(page).to have_content("The Princess Bride")
  end
end
