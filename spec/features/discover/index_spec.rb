require 'rails_helper'

RSpec.describe 'the discover-index page' do
  it 'has button to go to top rated movies' do
    visit discover_path

    expect(page).to have_button("Find Top Rated Movies")
    click_button("Find Top Rated Movies")
    # expect(page).to have_current_path(movies_path)
    expect(current_path).to eq(movies_path)

  end

  it 'has button to go to top rated movies' do
    visit discover_path

    expect(page).to have_button("Find Movies")
    expect(find('form')).to have_content('Search')
    # expect(page).to have_form("Search")

    fill_in :query, with: "Princess"
    click_on "Find Movies"
    # click_button("Find Movies")

    expect(current_path).to eq(movies_path)
  end
end
