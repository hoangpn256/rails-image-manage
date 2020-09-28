# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!, only: :index

  def index
    render json: {status: true, message: 'test'}
  end

  protected

  def authenticate_user!
    return if user_signed_in?

    render json: {status: false, message: 'Authentication Error !', code: 401}, status: 401
  end
end
