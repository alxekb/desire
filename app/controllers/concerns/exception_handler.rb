module ExceptionHandler
  class MissingToken < StandardError; end
  extend ActiveSupport::Concern

  included do
    rescue_from ExceptionHandler::MissingToken, with: :four_twenty_two
  end

  private

  def four_twenty_two(error)
    json_response({ message: error.message }, :unprocessible_entity)
  end
end
