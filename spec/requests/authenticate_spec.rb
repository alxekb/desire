require 'rails_helper'

RSpec.describe AuthenticateUser, type: :request do
  describe 'POST /login' do
    let(:user) { create(:user) }
    let(:headers) { headers_with_token.except('Authorization') }
    let(:valid_credentials)  do
      {
        login: user.login,
        password: user.password
      }
    end
    let(:invaild_credentials) do
      {
        login: 'foo',
        password: Faker::Internet.password
      }
    end

    context 'when request is vaild' do
      before { post '/login', params: valid_credentials, headers: headers }

      it "returns an user's authentication token" do
        expect(response).to have_http_status 200
        expect(json['auth_token']).not_to be_nil
      end
    end

    context 'when request is invalid' do
      before { post '/login', params: invaild_credentials, headers: headers}

      it 'returns an error' do
        expect(response).to have_http_status 401
        expect(json['message']).to match(/Invalid credentials./)
      end
    end
  end
end
