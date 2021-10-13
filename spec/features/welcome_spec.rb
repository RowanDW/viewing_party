require 'rails_helper'

RSpec.describe "The welcome page" do
  it "has a welcome messgae and description" do
    visit root_path

    within('#welcome') do
      expect(page).to have_content("Welcome to Viewing Party")
      expect(page).to have_content("Explore movies and create a viewing party event for you and your friends to watch a movie together")
    end
  end

  it "has a link to register a user" do
    visit root_path

    expect(page).to have_link("New to Viewing Party? Register Here")
  end

  it "can log in with valid credentials" do
    user = User.create(name: 'Rowan', email: "rowan@test.com", password: "test")

    visit root_path

    within('#log_in') do
      fill_in :email, with: user.email
      fill_in :password, with: user.password
      click_on "Log In"
    end

    expect(current_path).to eq(dashboard_path)

    expect(page).to have_content("Welcome, #{user.name}")
  end

  it "cannot log in with bad credentials" do
    user = User.create(name: 'Rowan', email: "rowan@test.com", password: "test")

    visit root_path

    within('#log_in') do
      fill_in :email, with: user.email
      fill_in :password, with: 'wrong password'
      click_on "Log In"
    end

    expect(current_path).to eq(root_path)

    expect(page).to have_content("Email or password were incorrect")
  end
end
