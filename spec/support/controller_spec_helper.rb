module ControllerSpecHelper
  def token_generator(user_id)
    JsonWebToken.encode(user_id: user_id)
  end

  def expired_token_generator(user_id)
    JsonWebToken.encode({ user_id: user_id }, (Time.now.to_i - 10))
  end

  def headers_with_token
    {
      "Authorization" => token_generator(user.id),
      "ACCEPT" => "application/json"
    }
  end

  def headers_with_empty_token
    {
      "Authorization" => nil,
      "ACCEPT" => "application/json"
    }
  end
end
