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

     xit "can add friends with an email" do
       visit dashboard_path

       within("#added-friends") do
         expect(page).to_not have_content(@kevin.name)
         expect(page).to have_content('You currently have no friends')
       end

       within('#add-friend') do
         fill_in 'friendship[email]', with: @kevin.email
         click_on 'Add Friend'
       end

       expect(current_path).to eq(dashboard_path)
       expect(page).to have_content("#{@kevin.name} successfully added!")

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
end
