require 'rails_helper'

RSpec.describe "The dashboard page" do
  it 'can log out a logged in user' do
    user = User.create(name: 'Rowan', email: "rowan@test.com", password: "test")

    visit root_path
    expect(page).to have_link("New to Viewing Party? Register Here")
    expect(page).to_not have_link("Log Out")

    fill_in :email, with: user.email
    fill_in :password, with: user.password

    click_on "Log In"

    visit root_path
    expect(page).to_not have_link("New to Viewing Party? Register Here")
    expect(page).to have_link("Log Out")

    click_on "Log Out"

    expect(current_path).to eq(root_path)
    expect(page).to have_link("New to Viewing Party? Register Here")
    expect(page).to_not have_link("Log Out")
  end
end
