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
  end

  # before(:each) do
  # end
  #
  # describe 'class methods' do
  #   describe '#name' do
  #     it 'returns ' do
  #       expect(Class.name).to eq()
  #     end
  #   end
  # end
  #
  # describe 'instance methods' do
  #   describe '._name' do
  #     it 'returns ' do
  #       expect(@var._name).to eq()
  #     end
  #   end
  # end
end
