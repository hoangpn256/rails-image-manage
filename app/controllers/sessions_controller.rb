# frozen_string_literal: true

class SessionsController < Devise::SessionsController
  skip_before_action :verify_authenticity_token
  respond_to :json

  def show
    render json: current_user
  end

  private

  def respond_with(_resource, _opts = {})
    render json: { status: true, token: current_token }
  end

  def respond_to_on_destroy
    render json: { status: true, message: 'Logout' }, status: 200
  end

  def current_token
    request.env['warden-jwt_auth.token']
  end
end
