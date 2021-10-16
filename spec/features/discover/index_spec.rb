require 'rails_helper'

RSpec.describe 'the discover-index page' do
  it 'has button to go to top rated movies', :vcr do
    visit discover_path

    expect(page).to have_button("Find Top Rated Movies")
    click_button("Find Top Rated Movies")

    expect(current_path).to eq(movies_path)
    expect(page).to have_content("Venom: Let There Be Carnage")
  end

  it 'has a movie search field', :vcr do
    visit discover_path

    fill_in :query, with: "Princess"
    click_on "Find Movies"

    expect(current_path).to eq(movies_path)
    expect(page).to have_content("The Princess and the Frog")
  end
end
