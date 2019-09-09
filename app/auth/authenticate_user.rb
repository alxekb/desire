class AuthenticateUser
  def initialize(login, password)
    @login = login
    @password = password
  end

  def call
    JsonWebToken.encode(user_id: user.id) if user
  end

  private

  attr_reader :login, :password

  def user
    user = User.find_by(login: login)
    return user if user && user&.authenticate(password)
    raise ExceptionHandler::AuthenticationError, Message.invalid_credentials
  end
end
