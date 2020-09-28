# frozen_string_literal: true

class SessionsController < Devise::SessionsController
  skip_before_action :verify_authenticity_token
  respond_to :json

  def create
    user = User.find_for_authentication(email: params[:email])
    if user.valid_password?(params[:password])
      render json: {status: true, token: user.token_generate, resource: user}
    else
      render json: {status: false, message: 'invalid username/password'}
    end
  end

  def show
    render json: current_user
  end

  private

  def respond_to_on_destroy
    render json: { status: true, message: 'Logout' }, status: 200
  end

  def current_token
    request.env['warden-jwt_auth.token']
  end
end
