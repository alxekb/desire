module ControllerSpecHelper
  def token_generator(user_id)
    JsonWebToken.encode(user_id: user_id)
  end

  def expired_token_generator(user_id)
    JsonWebToken.encode({ user_id: user_id }, (Time.now.to_i - 10))
  end

  def valid_headers
    {
      "Authorization" => token_generator(user_id),
      "ContentType" => "application/json"
    }
  end

  def invalid_headers
    {
      "Authorization" => nil,
      "ContentType" => "application/json"
    }
  end
end
