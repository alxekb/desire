class Message
  def self.not_found(record = 'record')
    "Sorry, #{record} nof found!"
  end

  def self.invalid_credentials
    'Invalid credentials.'
  end

  def self.unauthorized_request
    'Unauthorized request.'
  end

  def self.missing_token
    'Missing token'
  end

  def self.invalid_token
    'Invaild token'
  end
end
