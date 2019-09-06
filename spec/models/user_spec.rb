require 'rails_helper'

RSpec.describe User, type: :model do
  subject { build(:user) }

  describe 'validations' do
    it { should validate_presence_of(:login) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_presence_of(:signature) }
    it { should validate_presence_of(:name) }
  end

  describe 'associations' do
    it { should have_many(:posts) }
  end

  let(:user) { build :user }
  describe '#generate_token' do
    it 'generates access token' do
      expect(user.token).to be_nil
      user.save!
      expect(user.token).not_to be_nil
    end
  end
end
