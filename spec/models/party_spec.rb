require 'rails_helper'

RSpec.describe Party, type: :model do
  describe 'relationships' do
    it { should belong_to(:host) }
    it { should have_many(:invites) }
    it { should have_many(:guests).through(:invites) }
  end

  describe 'validations' do
    it { should validate_presence_of(:movie) }
    it { should validate_presence_of(:day) }
    it { should validate_presence_of(:start_time) }
    it { should validate_presence_of(:duration) }
    it { should validate_numericality_of(:duration) }
    it { should validate_presence_of(:host_id) }
  end

  before(:each) do
    @rowan = User.create(name: 'Rowan', email: "rowan@test.com", password: "test")
    @party = Party.create(movie: 385128, duration: 180, day: '2000-01-01', start_time: '05:54:42', host_id: @rowan.id)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@rowan)
  end

  describe 'instance methods' do
    describe '.title' do
      it 'returns the title of the movie', :vcr do
        expect(@party.title).to eq("F9")
      end
    end
  end
end
