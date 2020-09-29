# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # before_action :authenticate_user!, only: :index
  include Response
  include ExceptionHandler
  include Pagy::Backend

  def index
    # success_response({}, :unprocessable_entity)
    # User.find(id: 'test')
    # @user = User.create!(email: '', password: '123456')
    # head :no_content
    # render json: {status: true, message: 'test'}, status: :destroy
  end

  protected

  def authenticate_user!
    raise ExceptionHandler::AuthenticationError unless user_signed_in?
  end
end
