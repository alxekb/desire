require 'rails_helper'

RSpec.describe 'Authenticate', type: :request do
  describe 'POST /login' do
    let(:user) { create(:user) }
    let(:headers) { { 'Authorization' => token_generator(user.id) } }
    let(:invalid_headers) { { 'Authotization' => nil } }

    context 'with walid token' do
      
    end
  end
end
