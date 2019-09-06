module ExceptionHandler
  extend ActiveSupport::Concern

  class MissingToken < StandardError; end

  included do
    rescue_from ExceptionHandler::MissingToken, with: :four_twenty_two
  end

  private

  def four_twenty_two(e)
    json_response({ message: e.message }, :unprocessible_entity)
  end
end
