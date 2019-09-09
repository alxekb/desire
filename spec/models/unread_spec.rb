require 'rails_helper'

RSpec.describe Unread, type: :model do
  describe 'associations' do
    it { should belong_to(:viewer) }
    it { should belong_to(:news) }
  end

  describe 'validations' do
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:post_id) }
  end
end
