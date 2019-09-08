require 'rails_helper'

RSpec.describe AuthenticateUser do
  let(:user) { create(:user) }
  subject(:invalid_authentication) { described_class.new('foo', 'bar') }
  subject(:valid_authentication) { described_class.new(user.login, user.password) }

  describe '#call' do
    context 'with invalid credentials' do
      it 'raises an authentication error' do
        expect { invalid_authentication.call }
          .to raise_error(
            ExceptionHandler::AuthenticationError, Message.invalid_credentials
          )
      end
    end

    context 'with valid credentials' do
      it 'retutn token' do
        token = valid_authentication.call
        expect(token).not_to be_empty
      end
    end
  end
end
