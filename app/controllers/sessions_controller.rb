# frozen_string_literal: true

class SessionsController < Devise::SessionsController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!, only: :show
  respond_to :json

  def create
    user = User.find_for_authentication(email: params[:email])
    raise ExceptionHandler::InvalidAccountError unless user.valid_password?(params[:password])

    success_response({ token: user.token_generate, user: user })
  end

  def show
    success_response(UserSerializer.new(current_user))
  end

  private

  def respond_to_on_destroy
    success_response(message: Message.logout)
  end

  def current_token
    request.env['warden-jwt_auth.token']
  end
end
