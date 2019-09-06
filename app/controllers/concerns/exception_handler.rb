module ExceptionHandler
  extend ActiveSupport::Concern

  class MissingToken  < StandardError; end
  class NotAuthorized < StandardError; end

  included do
    rescue_from ExceptionHandler::MissingToken, with: :four_twenty_two
    rescue_from ExceptionHandler::NotAuthorized, with: :unauthorized_request
  end

  private

  def four_twenty_two(error)
    json_response({ message: error.message }, :unprocessible_entity)
  end

  def unauthorized_request(error)
    json_response({ message: error.message }, :unauthorized)
  end
end
