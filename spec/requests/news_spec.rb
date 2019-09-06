require 'rails_helper'

RSpec.describe 'News API', type: :request do
  let!(:news) { create(:post) }
  let(:news_id) { news.id }

  describe 'GET /news' do
    before { get '/news' }

    it 'return status 200' do
      expect(response).to have_http_status(200)
    end

    it 'return news' do
      expect(json).not_to be_empty
      expect(json.size).to eq(1)
    end
  end

  describe 'GET /news/:id' do
    before { get "/news/#{news_id}" }

    it 'return status 200' do
      expect(response).to have_http_status(200)
    end

    it 'return news' do
      expect(json).not_to be_empty
    end
  end
end
