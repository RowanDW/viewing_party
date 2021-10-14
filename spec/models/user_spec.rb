require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do
    it { should have_secure_password }
    it { should have_many(:friendships) }
    it { should have_many(:friends).through(:friend_relationships) }
    it { should have_many(:invites) }
    # it { should have_many(:guest_parties).through(:invites) }
    it { should have_many(:parties).through(:invites) }
    it { should have_many(:hosted_parties) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
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
