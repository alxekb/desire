require 'rails_helper'

RSpec.describe 'Authors API' do
  let(:user) { create(:user) }
  let!(:post) { create(:post, user_id: user.id) }
  let(:headers) { headers_with_token }
  let(:empty_headers) { headers_with_empty_token }

  describe ' GET /authors' do
    context 'when getting an authors URL' do
      before { get '/authors', params: {}, headers: headers }

      it 'retutns a status 200' do
        expect(response).to have_http_status 200
      end

      it 'returns a JSON array' do
        expect(json).not_to be_empty
        expect(json['authors'].count).to eq 1
      end

      it 'returns authors\'s data' do
        expect(json['authors'][0]['name']).to eq user.name
        expect(json['authors'][0]['signature']).to eq user.signature
      end
    end
  end

  describe 'GET /authors/:id' do
    context 'when getting author\s URL'
      before { get "/authors/#{user.id}", params: user.id, headers: headers_with_empty_token }

      it 'returns a status 200' do
        expect(response).to have_http_status 200
      end

      it 'returns an autor\s news' do
        expect(json['news'].count).to eq 1
        expect(json['news'][0]['title']).to eq user.posts.last.title
        expect(json['news'][0]['notice']).to eq user.posts.last.notice
        expect(json['news'][0]['content']).to eq user.posts.last.content
      end

      it 'returns an author signature' do
        expect(json['author']['signature']).to eq user.signature
      end
    end
end
