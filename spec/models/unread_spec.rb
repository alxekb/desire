require 'rails_helper'

RSpec.describe Unread, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:post) }
  end
end
