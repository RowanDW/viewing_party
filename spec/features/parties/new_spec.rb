require 'rails_helper'

RSpec.describe "Parties New form" do
  before(:each)do
    @rowan = User.create(name: 'Rowan', email: "rowan@test.com", password: "test")
    @kevin = User.create(name: 'Kevin', email: "kevin@test.com", password: "test")
    @jules = User.create(name: 'Jules', email: "jules@test.com", password: "test")
    @hanna = User.create(name: 'Hanna', email: "hanna@test.com", password: "test")

    # @movie = Movie.create!(id: 550988, title: "Free Guy", runtime: 115)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@kevin)
  end

  context "if user has no added friends" do
    xit "creates a party" do

      visit "/parties/new?id=550988"
      save_and_open_page
      fill_in 'date', with: '12/12/21'
      fill_in 'start_time', with: '5:00 PM'
      fill_in 'duration', with: 200
      click_on "Create Party"

      expect(page).to_not have_content("Invite:")
      expect(page).to have_content("You've created a Viewing Party!")
      expect(current_path).to eq(dashboard_path)
    end

    xit "can't create party with a duration less than the movie runtime" do

      fill_in 'date', with: '12/12/21'
      fill_in 'start_time', with: '5:00 PM'
      fill_in 'duration', with: 55
      click_on "Create Party"

      expect(page).to have_content("Party duration cannot be less than movie run time.")
    end

    xit "can't create a party with empty fields" do

      fill_in 'duration', with: 190
      click_on "Create Party"

      expect(page).to have_content("You must enter a valid start time, date and duration.")
    end
  end


  # context "if user has friends" do
  #   it 'shows friends you can invite on the form' do
  #     @kevin.friends.push(@rowan, @jules)

  #     expect(page).to have_content("Invite:")
  #     expect(page).to have_content(@rowan.name)
  #     expect(page).to have_content(@jules.name)
  #   end
  #
  #   it "creates party with invited friends" do
  #
  #     fill_in 'date', with: '12/12/21'
  #     fill_in 'start_time', with: '5:00 PM'
  #     fill_in 'duration', with: 200
  #     check "#{@rowan.name}]"
  #     click_on "Create Party"
  #
  #     expect(current_path).to eq(dashboard_path)
  #     # expect(page).to have_content("Free Guy")
  #   end
  # end
end
