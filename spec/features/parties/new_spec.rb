require 'rails_helper'

RSpec.describe 'the new parties page' do
  before :each do
    @rowan = User.create(name: 'Rowan', email: "rowan@test.com", password: "test")
    @kevin = User.create(name: 'Kevin', email: "kevin@test.com", password: "test")
    @jules = User.create(name: 'Jules', email: "jules@test.com", password: "test")
    @hanna = User.create(name: 'Hanna', email: "hanna@test.com", password: "test")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@rowan)
  end

  it "can create a new viewing party", :vcr do
    visit movie_path(385128)

    click_button ("New Viewing Party")
    expect(current_path).to eq(new_party_path)

    expect(page).to have_content("New Viewing Party")
    expect(page).to have_content("F9")


    fill_in 'party[day]', with: "2021-12-12"
    fill_in 'party[start_time]', with: "18:30"
    click_button "Create Party"

    expect(page).to have_content("Party successfully created!")
    expect(current_path).to eq(dashboard_path)

    within('#hosting') do
      expect(page).to have_content('F9')
      expect(page).to have_content('December 12, 2021')
      expect(page).to have_content('6:30 pm')
      expect(page).to have_content('143 minutes')
      expect(page).to have_content('Hosting')
    end
  end

  it "new viewing party sad path", :vcr do
    visit movie_path(385128)

    click_button ("New Viewing Party")

    fill_in 'party[day]', with: "2021-12-12"
    fill_in 'party[start_time]', with: ""
    click_button "Create Party"

    expect(page).to have_content("Error: invalid party")
    expect(current_path).to eq(new_party_path)
  end

  it "can invite friends to party", :vcr do
    friendship1 = Friendship.create!(user_id: @rowan.id, friend_id: @kevin.id)
    friendship2 = Friendship.create!(user_id: @rowan.id, friend_id: @jules.id)
    visit movie_path(385128)

    click_button ("New Viewing Party")

    fill_in 'party[day]', with: "2021-12-12"
    fill_in 'party[start_time]', with: "18:30"
    check "friends[#{@kevin.id}]"
    uncheck "friends[#{@jules.id}]"
    click_button "Create Party"

    expect(current_path).to eq(dashboard_path)

    within('#hosting') do
      expect(page).to have_content('Invited')
      expect(page).to have_content(@kevin.name)
      expect(page).to_not have_content(@jules.name)
    end

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@kevin)
    @kevin.reload
    visit dashboard_path

    within('#invited') do
      expect(page).to have_content('F9')
      expect(page).to have_content('Host: Rowan')
    end
  end

  it "wont create a party with a duration shorer than runtime", :vcr do
    visit movie_path(385128)

    click_button ("New Viewing Party")

    fill_in 'party[duration]', with: "142"
    fill_in 'party[day]', with: "2021-12-12"
    fill_in 'party[start_time]', with: "18:30"
    click_button "Create Party"

    expect(page).to have_content("Error: invalid party - duration must be at least 143 minutes")
    expect(current_path).to eq(new_party_path)
  end
end
