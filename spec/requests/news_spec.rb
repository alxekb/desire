require 'rails_helper'

RSpec.describe 'News API', type: :request do
  let!(:user) { create(:user) }
  let!(:post) { create(:post, user_id: user.id) }
  let!(:post2) { create(:post, user_id: user.id) }
  let!(:post3) { create(:post, user_id: user.id) }
  let(:headers) { headers_with_token }
  let(:empty_headers) { headers_with_empty_token }

  describe 'GET /news with valid token' do
    before { get '/news', headers: headers }

    it 'return status 200' do
      expect(response).to have_http_status 200
    end

    it 'return valid news' do
      expect(json).not_to be_empty
      expect(json['news'].count).to eq 3
      expect(json['news'][0]['title']).to eq post.title
      expect(json['news'][1]['notice']).to eq post2.notice
      expect(json['news'][2]['content']).to eq post3.content
    end
  end

  describe 'GET /news/:id vith valid token' do
    before { get "/news/#{post.id}", params: {}, headers: headers }

    it 'return status 200' do
      expect(response).to have_http_status 200
    end

    it 'return news' do
      expect(json).not_to be_empty
      expect(json['news'].count)
    end

    before { get '/news', headers: headers }

    it 'excludes news from user\'s feed' do
        expect(json['news'].count).to eq 2
        expect(json['news'][0]['title']).not_to eq post.title
        expect(json['news'][0]['title']).to eq post2.title
    end
  end
end
