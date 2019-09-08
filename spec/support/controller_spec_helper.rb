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
      "ContentType" => "application/json"
    }
  end

  def headers_without_token
    {
      "Authorization" => nil,
      "ContentType" => "application/json"
    }
  end
end
