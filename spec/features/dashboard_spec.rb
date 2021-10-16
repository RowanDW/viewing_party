require 'rails_helper'

RSpec.describe "The dashboard page" do

  before :each do
    @rowan = User.create(name: 'Rowan', email: "rowan@test.com", password: "test")
    @kevin = User.create(name: 'Kevin', email: "kevin@test.com", password: "test")
    @jules = User.create(name: 'Jules', email: "jules@test.com", password: "test")
    @hanna = User.create(name: 'Hanna', email: "hanna@test.com", password: "test")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@rowan)
  end

  it 'has a welcome message' do
    visit dashboard_path
    expect(page).to have_content("Welcome #{@rowan.name}!")
  end

  it "has a button to discover movies" do
    visit dashboard_path

    expect(page).to have_button('Discover Movies')

    click_on 'Discover Movies'

    expect(current_path).to eq(discover_path)
  end

  context 'friends section' do
    it "displays friends" do
      friendship1 = Friendship.create!(user_id: @rowan.id, friend_id: @kevin.id)
      friendship2 = Friendship.create!(user_id: @rowan.id, friend_id: @jules.id)
      friendship3 = Friendship.create!(user_id: @kevin.id, friend_id: @hanna.id)

      visit dashboard_path

      expect(page).to have_content("My Friends:")

      within("#added-friends") do
       expect(page).to have_content(@kevin.name)
       expect(page).to have_content(@jules.name)
       expect(page).to_not have_content(@hanna.name)
      end
    end

    it "displays a message when a user has no friends" do
      visit dashboard_path

      within("#added-friends") do
        expect(page).to have_content('You currently have no friends')
      end
    end

    it "can add friends with an email" do
      visit dashboard_path

      within("#added-friends") do
        expect(page).to_not have_content(@kevin.name)
        expect(page).to have_content('You currently have no friends')
      end

      within('#add-friend') do
        fill_in 'friendship[email]', with: @kevin.email
        click_on 'Add Friend'
      end
      expect(page).to have_content("#{@kevin.name} successfully added!")

      @rowan.reload
      @kevin.reload
      visit dashboard_path

      expect(current_path).to eq(dashboard_path)

      within("#added-friends") do
        expect(page).to have_content(@kevin.name)
      end
    end

    it "sad path for adding friends" do
      visit dashboard_path

      within("#added-friends") do
        expect(page).to_not have_content(@kevin.name)
        expect(page).to have_content('You currently have no friends')
      end

      within('#add-friend') do
        fill_in 'friendship[email]', with: 'invalid email'
        click_on 'Add Friend'
      end

      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content('Error: invalid email')
    end
  end

  context 'parties section' do
    it "displays all parties a user has been invited to and hosted", :vcr do
      party = Party.create(movie: 385128, duration: 180, day: '2000-01-01', start_time: '05:54:42', host_id: @rowan.id)
      party2 = Party.create(movie: 51497, duration: 180, day: '2000-01-01', start_time: '05:54:42', host_id: @kevin.id)
      party3 = Party.create(movie: 9799, duration: 180, day: '2000-01-01', start_time: '05:54:42', host_id: @kevin.id)
      invite = Invite.create(party_id: party2.id, guest_id: @rowan.id)
      invite2 = Invite.create(party_id: party3.id, guest_id: @hanna.id)
      visit dashboard_path

      within('#parties') do
        expect(page).to have_content("Viewing Parties:")
      end
      within('#hosting') do
        expect(page).to have_content("My Parties:")
        expect(page).to have_content(party.title)
        expect(page).to_not have_content(party2.title)
        expect(page).to_not have_content(party3.title)
      end
      within('#invited') do
        expect(page).to have_content("Invitations:")
        expect(page).to have_content(party2.title)
        expect(page).to_not have_content(party.title)
        expect(page).to_not have_content(party3.title)
      end
    end

    it "displays all the attributes of each party", :vcr do
      party = Party.create(movie: 385128, duration: 180, day: '2000-01-01', start_time: '05:54:42', host_id: @rowan.id)
      party2 = Party.create(movie: 51497, duration: 180, day: '2000-01-01', start_time: '05:54:42', host_id: @kevin.id)
      invite = Invite.create(party_id: party.id, guest_id: @kevin.id)
      invite2 = Invite.create(party_id: party.id, guest_id: @hanna.id)
      invite3 = Invite.create(party_id: party2.id, guest_id: @jules.id)
      invite4 = Invite.create(party_id: party2.id, guest_id: @rowan.id)
      visit dashboard_path

      within("#party-#{party.id}") do
        expect(page).to have_content(party.title)
        expect(page).to have_content(party.duration)
        expect(page).to have_content(party.day.strftime('%B %d, %Y'))
        expect(page).to have_content(party.start_time.strftime('%l:%M %P'))
        expect(page).to have_content('Hosting')
        expect(page).to have_content(@kevin.name)
        expect(page).to have_content(@hanna.name)
      end

      within("#party-#{party2.id}") do
        expect(page).to have_content(party2.title)
        expect(page).to have_content(party2.duration)
        expect(page).to have_content(party2.day.strftime('%B %d, %Y'))
        expect(page).to have_content(party2.start_time.strftime('%l:%M %P'))
        expect(page).to have_content("Host: #{@kevin.name}")
        expect(page).to have_content(@jules.name)
        expect(page).to have_content(@rowan.name)
      end
    end

    it "links each movie title to the movie show page", :vcr do
      party = Party.create(movie: 385128, duration: 180, day: '2000-01-01', start_time: '05:54:42', host_id: @rowan.id)
      party2 = Party.create(movie: 51497, duration: 180, day: '2000-01-01', start_time: '05:54:42', host_id: @kevin.id)
      invite = Invite.create(party_id: party.id, guest_id: @kevin.id)
      invite2 = Invite.create(party_id: party.id, guest_id: @hanna.id)
      invite3 = Invite.create(party_id: party2.id, guest_id: @jules.id)
      invite4 = Invite.create(party_id: party2.id, guest_id: @rowan.id)

      visit dashboard_path

      within("#party-#{party.id}") do
        expect(page).to have_link(party.title)
        click_on party.title
      end

      expect(current_path).to eq(movie_path(party.movie))
    end

    it "displays text if there are no parties" do
      visit dashboard_path

      within('#hosting') do
        expect(page).to have_content("You are not hosting any parties")
      end

      within('#invited') do
        expect(page).to have_content("You have not been invited to any parties")
      end
    end
  end
end
