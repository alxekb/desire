require 'rails_helper'

RSpec.describe 'Authors API' do
  let(:author) { create(:user) }
  let(:news) { create(:news), user: author }
  let(:headers) { headers_with_token }
  let(:invalid_headers) { headers_without_token }

  describe ' GET /authors' do
    before { get '/autors' }
  end
end
