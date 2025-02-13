require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do
    it { should have_secure_password }
    it { should have_many(:friendships) }
    it { should have_many(:friends).through(:friendships) }
    it { should have_many(:invites) }

    it { should have_many(:parties).through(:invites) }
    it { should have_many(:hosted_parties) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
  end
end
