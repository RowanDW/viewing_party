require 'rails_helper'

RSpec.describe "User registration form" do
  it "creates new user" do
    visit root_path

    click_on "New to Viewing Party? Register Here"

    expect(current_path).to eq(registration_path)

    name = "Rowan D"
    email = "rowan@test.com"
    password = "test"

    within('#new_user') do
      fill_in 'user[name]', with: name
      fill_in 'user[email]', with: email
      fill_in 'user[password]', with: password
      fill_in 'user[password_confirmation]', with: password
    end

    click_on "Create Account"

    expect(current_path).to eq(dashboard_path)
    new_user = User.last

    expect(page).to have_content("Welcome, #{name}!")
    expect(new_user.email).to eq(email)
    expect(new_user.name).to eq(name)
  end

  it "register user sad path" do
    visit registration_path

    name = "Rowan D"
    email = ""
    password = "test"

    within('#new_user') do
      fill_in 'user[name]', with: name
      fill_in 'user[email]', with: email
      fill_in 'user[password]', with: password
      fill_in 'user[password_confirmation]', with: password
    end

    click_on "Create Account"

    expect(current_path).to eq(registration_path)
    expect(page).to have_content("Error invalid user")
  end
end
