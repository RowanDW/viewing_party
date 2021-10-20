require 'rails_helper'

RSpec.describe "Parties New form" do
  before(:each)do
    @rowan = User.create(name: 'Rowan', email: "rowan@test.com", password: "test")
    @kevin = User.create(name: 'Kevin', email: "kevin@test.com", password: "test")
    @jules = User.create(name: 'Jules', email: "jules@test.com", password: "test")
    @hanna = User.create(name: 'Hanna', email: "hanna@test.com", password: "test")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@kevin)
  end

  context "if user has no added friends" do
    it "creates a party", :vcr do

      visit "/movies/550988"
      click_on "New Viewing Party"

      fill_in 'party[day]', with: '12/12/21'
      fill_in 'party[start_time]', with: '5:00 PM'
      fill_in 'party[duration]', with: 200
      click_on "Create Party"

      expect(page).to have_content("You've created a Viewing Party!")
      expect(current_path).to eq(dashboard_path)
    end

    it "can't create party with a duration less than the movie runtime", :vcr do

      visit "/movies/550988"
      click_on "New Viewing Party"

      fill_in 'party[day]', with: '12/12/21'
      fill_in 'party[start_time]', with: '5:00 PM'
      fill_in 'party[duration]', with: 2
      click_on "Create Party"

      expect(page).to have_content("Party duration cannot be less than movie run time.")
    end

    it "can't create a party with empty fields", :vcr do
      visit "/movies/550988"
      click_on "New Viewing Party"

      click_on "Create Party"

      expect(page).to have_content("You must enter a valid start time, date and duration.")
    end
  end


  context "if user has friends" do
    it 'shows friends you can invite on the form', :vcr do
      @kevin.friends.push(@rowan, @jules)

      visit "/movies/550988"
      click_on "New Viewing Party"

      expect(page).to have_content(@rowan.name)
      expect(page).to have_content(@jules.name)
    end

    it "creates party with invited friends", :vcr do
      @kevin.friends.push(@rowan, @jules)

      visit "/movies/550988"
      click_on "New Viewing Party"

      fill_in 'party[day]', with: '12/12/21'
      fill_in 'party[start_time]', with: '5:00 PM'
      fill_in 'party[duration]', with: 200
      check "friend_add[#{@rowan.id}]"
      click_on "Create Party"

      expect(page).to have_content("You've created a Viewing Party!")
      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content("Free Guy")
      expect(page).to have_content("Rowan")
    end
  end
end
