# frozen_string_literal: true

module ExceptionHandler
  # provides the more graceful `included` method
  extend ActiveSupport::Concern

  # Define custom error subclasses - rescue catches `StandardErrors`
  class AuthenticationError < StandardError; end
  class InvalidAccountError < StandardError; end

  included do
    rescue_from ExceptionHandler::AuthenticationError, with: :unauthorized_request
    rescue_from ExceptionHandler::InvalidAccountError, with: :invalid_account
    rescue_from ActiveRecord::RecordInvalid, with: :four_twenty_two
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    rescue_from Pagy::OverflowError, with: :pagy_overflow
  end

  private

  def invalid_account
    error_response({ message: Message.invalid_account, code: ErrorCode::INVALID_ACCOUNT })
  end

  def record_not_found(error)
    error_response({ message: Message.not_found(error.model), code: ErrorCode::RECORD_NOT_FOUND }, :not_found)
  end

  def four_twenty_two(error)
    error_response({ message: error, code: ErrorCode::UN_PROCESS }, :unprocessable_entity)
  end

  def unauthorized_request
    error_response({ message: Message.unauthorized, code: ErrorCode::UN_AUTHORIZED }, :unauthorized)
  end

  def pagy_overflow(_error)
    error_response({ message: Message.pagy_overflow, code: ErrorCode::PAGY_OVERFLOW }, :forbidden)
  end
end
